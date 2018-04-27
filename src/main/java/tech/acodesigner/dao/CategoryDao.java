package tech.acodesigner.dao;

import tech.acodesigner.dto.CategoryDto;
import tech.acodesigner.po.CategoryPo;
import tech.acodesigner.util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 * Created by 77239 on 2017/2/16/0016.
 */
public class CategoryDao {

    public static ArrayList<CategoryDto> getCategories() throws SQLException, ClassNotFoundException {
        Connection conn = DBUtil.getCon();
        String sql = "SELECT blog_category.categoryId,categoryName,COUNT(articleId) AS categoryCount" +
                " FROM blog_article RIGHT JOIN blog_category" +
                " ON blog_article.categoryId=blog_category.categoryId" +
                " WHERE blog_category.categoryId>1 GROUP BY categoryName;";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        ResultSet rs = pstmt.executeQuery();
        ArrayList<CategoryDto> categories = new ArrayList<CategoryDto>();
        while (rs.next()) {
            CategoryDto category = new CategoryDto();
            category.setId(rs.getInt("categoryId"));
            category.setName(rs.getString("categoryName"));
            category.setCount(rs.getInt("categoryCount"));
            categories.add(category);
        }
        DBUtil.closeCon(conn);
        return categories;
    }

    public static CategoryPo getCategory(int id) throws SQLException, ClassNotFoundException {
        Connection conn = DBUtil.getCon();
        String sql = "SELECT * FROM blog_category WHERE categoryId=?;";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, id);
        ResultSet rs = pstmt.executeQuery();
        CategoryPo category = new CategoryPo();
        if (rs.next()) {
            category.setCategoryId(rs.getInt("categoryId"));
            category.setCategoryName(rs.getString("categoryName"));
        }
        DBUtil.closeCon(conn);
        return category;
    }

    public static void saveCategory(String name) throws SQLException, ClassNotFoundException {
        Connection conn = DBUtil.getCon();
        String sql = "INSERT INTO blog_category VALUES (null,?);";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, name);
        pstmt.executeUpdate();
        DBUtil.closeCon(conn);
    }

    public static void updateCategory(int categoryId, String categoryName) throws SQLException, ClassNotFoundException {
        Connection conn = DBUtil.getCon();
        String sql = "UPDATE blog_category SET categoryName=? WHERE categoryId=?;";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, categoryName);
        pstmt.setInt(2, categoryId);
        pstmt.executeUpdate();
        DBUtil.closeCon(conn);
    }

    public static void deleteCategory(int id) throws SQLException, ClassNotFoundException {
        Connection conn = DBUtil.getCon();
        String sql = "DELETE FROM blog_category WHERE categoryId=?;";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, id);
        pstmt.executeUpdate();
        DBUtil.closeCon(conn);
    }

    public static boolean exist(int id) throws SQLException, ClassNotFoundException {
        Connection conn = DBUtil.getCon();
        String sql = "SELECT * FROM blog_category WHERE categoryId=?;";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, id);
        ResultSet rs = pstmt.executeQuery();
        CategoryPo category = new CategoryPo();
        if (rs.next()) {
            return true;
        }
        DBUtil.closeCon(conn);
        return false;
    }
}
