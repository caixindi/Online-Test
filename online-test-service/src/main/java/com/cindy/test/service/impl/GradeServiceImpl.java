package com.cindy.test.service.impl;

import cn.hutool.core.util.StrUtil;
import cn.hutool.poi.excel.ExcelReader;
import cn.hutool.poi.excel.ExcelUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.cindy.test.common.dao.GradeDAO;
import com.cindy.test.common.exception.ServiceException;
import com.cindy.test.common.model.Grade;
import com.cindy.test.common.model.dto.ImportGradeDto;
import com.cindy.test.common.model.dto.QueryGradeDto;
import com.cindy.test.common.model.vo.GradeVo;
import com.cindy.test.common.util.FileUtil;
import com.cindy.test.common.util.PageUtil;
import com.cindy.test.service.GradeService;
import java.io.File;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

@Service
@RequiredArgsConstructor
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true, rollbackFor = Exception.class)
public class GradeServiceImpl extends ServiceImpl<GradeDAO, Grade> implements GradeService {

  private final GradeDAO gradeDAO;

  @Override
  public List<Grade> listByMajorId(Integer majorId) {
    LambdaQueryWrapper<Grade> qw = new LambdaQueryWrapper<>();
    qw.eq(Grade::getMajorId, majorId);
    return gradeDAO.selectList(qw);
  }

  @Override
  public Map<String, Object> listPage(Page<Grade> page, QueryGradeDto entity) {
    IPage<GradeVo> result = gradeDAO.pageVo(page, entity);
    return PageUtil.toPage(result);
  }

  @Override
  @Transactional(rollbackFor = Exception.class)
  public void save(ImportGradeDto entity) {
    List<Grade> grades = this.listByMajorId(entity.getMajorId());
    int level = entity.getLevel();
    List<Integer> gradeNumbers = grades.stream().filter(grade -> grade.getLevel().equals(level))
        .map(Grade::getGradeNumber).collect(Collectors.toList());
    String[] numbers = StrUtil.splitToArray(entity.getGradeNumbers(), ',');
    Grade grade = new Grade();
    grade.setLevel(entity.getLevel());
    grade.setMajorId(entity.getMajorId());
    for (String number : numbers) {
      int n = Integer.parseInt(number);
      if (!gradeNumbers.contains(n)) {
        grade.setGradeNumber(n);
        this.gradeDAO.insert(grade);
      }
    }
  }

  @Override
  public GradeVo selectVoById(Integer id) {
    return this.gradeDAO.getVoById(id);
  }

  @Override
  public void importMajorsExcel(MultipartFile multipartFile) {
    // 同步锁
    synchronized (this) {
      File file = FileUtil.toFile(multipartFile);
      // 读取 Excel 中的数据
      ExcelReader reader = ExcelUtil.getReader(file);
      // 读取班级的信息
      List<ImportGradeDto> grades = reader.read(4, 5, ImportGradeDto.class);
      for (ImportGradeDto grade : grades) {
        if (grade.getLevel() != null && grade.getGradeNumbers() != null
            && grade.getMajorId() != null) {
          // 直接插入，插入接口代做数据校验
          this.save(grade);
        } else {
          throw new ServiceException("请检查表格数据是否有有误");
        }
      }
    }
  }
}
