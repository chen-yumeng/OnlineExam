<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="common/header.jsp" %>
<style>
    .tm_register_body {
        background: url('../resources/home/images/001.jpg');
        background-size: cover;
        -moz-background-size: cover;
        background-repeat: no-repeat;
    }

    .tm_register_container {
        width: 500px;
        margin: 100px auto;
        clear: both
    }

    .tm_register_title {
        height: 80px;
        margin: 10px 0 15px 0;
        background: #fff;
        text-align: center;
        border-bottom: solid 1px #eee;
    }

    .tm_register_title img {
        height: 50px;
    }

    .tm_register_title span {
        font-size: 25px;
        line-height: 80px;
        font-family: 'Microsoft Yahei', Tahoma, Geneva, 'Simsun';
    }

    .tm_register_form {
        width: 100%;
        height: 630px;
        clear: both;
        -moz-border-radius: 8px;
        -webkit-border-radius: 8px;
        border-radius: 8px;
        padding: 1px;
        background: #fff;
    }

    .tm_register_table {
        width: 400px;
        margin: 20px auto;
    }

    .tm_register_table caption {
        text-align: center;
        margin: 0 0 10px 0
    }

    .tm_register_table tr th {
        width: 100px;
    }

    .tm_register_table tr td {
        width: 300px;
        text-align: left
    }

    .tm_register_title_table {
        width: 400px;
        margin: 0px auto;
    }

    .tm_register_title_table tr th {
        width: 100px;
    }

    .tm_register_title_table tr td {
        width: 300px;
        text-align: left
    }

    .tm_register_foot {
        width: 100%;
        line-height: 20px;
        text-align: center;
        clear: both;
        margin: 20px 0
    }

</style>
<body class="tm_register_body" style="">

<div class="tm_register_container">
    <div class="tm_register_form">
        <div class="tm_register_title">
            <table border="0" cellpadding="0" cellspacing="0" class="tm_register_title_table">
                <tbody>
                <tr>
                    <th><img src="../resources/home/images/logo_min.png" align="absmiddle"></th>
                    <td>
                        <span>???????????????</span>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>

        <form action="http://demo.tomexam.com/" id="form_register" method="post">
            <table border="0" cellpadding="5" cellspacing="0" class="tm_register_table">
                <caption>


                    <p>????????????????????????????????????????????????</p>


                </caption>
                <tbody>
                <tr>
                    <th>?????????</th>
                    <td>
                        <input type="text" class="validate[required,minSize[3]] tm_txt" name="name" maxlength="30"
                               value="" style="width:200px">
                        <span class="tm_required">*</span>
                    </td>
                </tr>
                <tr>
                    <th>
                        <div style="margin-bottom:45px">??? &nbsp; ???</div>
                    </th>
                    <td>
                        <input type="password" class="validate[required] tm_txt" name="password" id="u_userpass"
                               maxlength="30" value="" style="width:200px">
                        <span class="tm_required">*</span>

                        <div id="tm_level" class="pw-strength">
                            <div class="pw-bar"></div>
                            <div class="pw-bar-on"></div>
                            <div class="pw-txt">
                                <span>???</span>
                                <span>???</span>
                                <span>???</span>
                            </div>
                        </div>

                    </td>
                </tr>
                <tr>
                    <th>????????????</th>
                    <td>
                        <input type="password" class="validate[required,equals[u_userpass]] tm_txt" name="u_userpass2"
                               maxlength="30" value="" style="width:200px">
                        <span class="tm_required">*</span>
                    </td>
                </tr>
                <tr>
                    <th>??? &nbsp; ???</th>
                    <td>
                        <input type="text" name="studentId" class="validate[required] tm_txt" size="50" maxlength="30" style="width:200px">
                        <span class="tm_required">*</span>
                    </td>
                </tr>
                <tr>
                    <th>????????????</th>
                    <td>
                        <input type="text" name="truename" class="validate[required] tm_txt" size="50" maxlength="30" style="width:200px">
                        <span class="tm_required">*</span>
                    </td>
                </tr>
                <tr>
                    <th>????????????</th>
                    <td>
                        <select class="validate[required] tm_select" name="subjectId" style="width:214px">
                            <option value="">?????????</option>
                            <c:forEach items="${subjectList }" var="subject">
                                <option value="${subject.id }">${subject.name }</option>
                            </c:forEach>
                        </select>
                        <span class="tm_required">*</span>
                    </td>
                </tr>

                <tr>
                    <th>????????????</th>
                    <td>
                        <input type="text" class="validate[required] tm_txt" name="tel" maxlength="30" value="" style="width:200px">
                        <span class="tm_required">*</span>
                    </td>
                </tr>

                <tr>
                    <th></th>
                    <td>
                        <div style="margin-top:40px">


                            <button type="button" class="tm_btn tm_btn_primary" style="width:50%"
                                    onclick="tm.doRegister();">??????
                            </button>


                            <button type="button" class="tm_btn" onclick="tm.doGoBack();" style="width:30%">??????</button>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th></th>
                    <td></td>
                </tr>
                </tbody>
            </table>
        </form>
    </div>

    <div class="tm_register_foot">

        <div>Copyright ?? ??????????????? All Right Reserved 2020</div>
    </div>
</div>
<script type="text/javascript">
    $(document).ready(function () {
        tm_bindPasswordLevelChecker("u_userpass");
    });

    var tm = {
        doGoBack: function () {
            window.location.href = 'login';
        },

        doRegister: function () {

            var formcheck = $("#form_register").validationEngine('validate', {showOneMessage: true});

            if (!formcheck) {
                return false;
            }

            var u_username = $("input[name='name']").val();
            var u_userpass = $("input[name='password']").val();
            var u_truename = $("input[name='truename']").val();

            var u_subjectId = $("select[name='subjectId']").val();
            var u_tel = $("input[name='tel']").val();
            var reg = /^[1][3,4,5,7,8][0-9]{9}$/;

            if(!reg.test(u_tel)) {
                alert('???????????????????????????');
                return;
            }

            if (baseutil.isEmpty(u_username)) {
                alert('?????????????????????');
                return;
            }
            if (baseutil.isEmpty(u_userpass)) {
                alert('????????????????????????');
                return;
            }

            if (baseutil.containsSpecialWord(u_username)) {
                alert("????????????????????????????????????");
                return;
            }

            $(".tm_btn_primary").text('??????...');
            var tmdata = {
                "name": u_username, "password": u_userpass,
                "subjectId": u_subjectId, "tel": u_tel,
                "trueName": u_truename, "t": Math.random()
            };

            $.ajax({
                type: "POST",
                url: "register",
                dataType: "json",
                data: tmdata,
                success: function (data) {
                    if (data.type == 'success') {
                        window.location = "login.html";
                    } else {
                        alert(data.msg);
                        window.location.reload();
                    }
                },
                error: function () {
                    alert('???????????????????????????');
                    window.location.reload();
                }
            });
        }
    };
</script>


</body>
</html>