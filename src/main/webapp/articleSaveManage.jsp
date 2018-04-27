<%--
  Created by IntelliJ IDEA.
  User: 77239
  Date: 2017/2/16/0016
  Time: 23:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script type="text/javascript">
    $(document).ready(function() {
        $('select').material_select();
    });
    function notEmpty() {
        var title = document.getElementById("title").value;
        var content = CKEDITOR.instances.content.getData();
        var category = document.getElementById("category").value;
        if (title == null || title == "") {
            Materialize.toast("标题不能为空", 2000, "rounded");
            return false;
        }
        if (content == null || content == "") {
            Materialize.toast("内容不能为空", 2000, "rounded");
            return false;
        }
        if (category == null || category == "") {
            Materialize.toast("类别不能为空", 2000, "rounded");
            return false;
        }
        return true;
    }
</script>
<div class="row">
    <div class="col s12">
        <div class="card-panel">
            <form action="articleManage?action=save&articleId=${article.id}" method="post" onsubmit="return notEmpty()">
                <div class="input-field col s6">
                    <input id="title" name="title" type="text" class="validate" value="${article.title}">
                    <label for="title"><i class="material-icons left">title</i>标题</label>
                </div>
                <br><br><br><br>
                <div class="input-field col s6">
                    <select id="category" name="category">
                        <option value="" disabled selected>类别</option>
                        <c:forEach var="category" items="${categories}">
                            <option value="${category.id }" ${category.id==article.category.categoryId?'selected':''}>${category.name}</option>
                        </c:forEach>
                    </select>
                </div>
                <br><br><br><br>
                <div class="input-field col s6">
                    <select id="picture" name="picture" class="icons">
                        <option value="" disabled selected>图片</option>
                        <c:forEach var="picture" items="${pictures}">
                            <option value="${picture}" data-icon="images/article/${picture}" ${article.image==picture?'selected':'' }>${picture}</option>
                        </c:forEach>
                    </select>
                </div>
                <br><br><br><br>
                <div>
                    <textarea class="ckeditor" id="content" name="content">${article.content }</textarea>
                </div>
                <br>
                <button class="btn waves-effect waves-light green" type="submit" name="action">保存</button>
            </form>
        </div>
    </div>
</div>
<script>
    ClassicEditor
        .create(document.querySelector('.ckeditor'))
        .catch(error => {
            console.error(error);
        });
</script>