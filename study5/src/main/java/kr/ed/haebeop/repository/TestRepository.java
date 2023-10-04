package kr.ed.haebeop.repository;

import kr.ed.haebeop.domain.TestVO;
import org.junit.jupiter.api.Test;

import java.util.List;

public interface TestRepository {
    public List<TestVO> testList() throws Exception;
    public TestVO getTest(int num) throws Exception;
    public void testInsert(TestVO test) throws Exception;
}
