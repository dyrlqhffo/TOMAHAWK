package test;

import java.util.ArrayList;

import org.kosta.toma.model.dao.BoardDAO;
import org.kosta.toma.model.vo.BoardVO;
import org.kosta.toma.model.vo.ShopVO;

public class TestUnitSearchShops {

	public static void main(String[] args) {
		String title = "역전우동";
		try {
			ArrayList<ShopVO> list = BoardDAO.getInstance().searchShops(title);
			System.out.println(list);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
