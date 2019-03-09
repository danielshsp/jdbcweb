<%--
  Created by IntelliJ IDEA.
  User: gkx638
  Date: 29/11/2018
  Time: 12:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8"  %>
<%@ page import="java.sql.*"%>


<%
    String param = (String)request.getParameter("param");



    Connection conn = null;
    PreparedStatement stat = null;
    ResultSet rs = null;
    int srId = 0;
    int index = 0;
    String category = "";
    String subCategory = "";
    String thirdLevelCategory= "";
    String insertTime = "";
    String submitUser = null;
    String requestUser = "";
    String description = "";
    String today = "";
    String company = "";
    String yehida = "";
    String mikum = "";
    String prati = "";
    String mishpacha = "";
    String id = "";
    String title = "";
    String yehida_m= "";
    String krot_erua = "";
    String desc = null;
    String fileName = null;
    String file_date = null;
    String sug_m = "";
    String meorav = "";
    String s_prati = "";
    String s_mish = "";
    String rechush = "";
    String erech ="" ;
    String erech_k = "";
    int hugsha = 0;
    String mispar_tl = "";
    String tachanat_m = "";
    String yomanait = "";
    String codeworksr = "";
    String hugsha_s= "";
    String sub_prati= "";
    String sub_mish= "";
    String descTitle = "תיאור";
    String ConnectionUrl= "";


    String reqsTmp = "";


    if(param == null)
        return;


    try {

        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        ConnectionUrl = "jdbc:sqlserver://localhost:1433;databaseName=sysaid17;user=sa;password=A123456a;";
        conn=DriverManager.getConnection(ConnectionUrl);
        //conn = DBConnection.getInstance().getConn("motorolaclalit");
        stat = conn.prepareStatement("select * from v_print_out2 where id = ?");
        stat.setString(1, param);
        rs = stat.executeQuery();

        if(rs != null && rs.next())  {
            srId = rs.getInt("id");
            category = rs.getString("problem_type");
            subCategory = rs.getString("problem_sub_type");
            thirdLevelCategory = rs.getString("third_level_category");
            insertTime = rs.getString("insert_time");
            submitUser = rs.getString("submit_user");
            requestUser = rs.getString("sr_cust_req_user");
            today = rs.getString("today");
            description = rs.getString("description");
            company = rs.getString("company");
            yehida = rs.getString("sr_cust_yehida");
            mikum = rs.getString("sr_cust_mikum_meduyak");
            prati = rs.getString("prati");
            mishpacha = rs.getString("mish");


        }

    } catch(Exception e) {
        out.print("=======>"+e);
    } finally {
        try {if(rs != null) {rs.close();}} catch(Exception ee) {}
        try {if(stat != null) {stat.close();}} catch(Exception ee) {}
        try {if(conn != null) {conn.close();}} catch(Exception ee) {}
    }



    if(submitUser == null)
        submitUser = "";
    if(prati==null)
        prati="";
    if(mishpacha==null)
        mishpacha="";



%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>

    <title>דוח אירוע</title>
    <style>

        body{
            direction: rtl;
        }

        .td-caption {
            font-weight: bold;
        }
        footer{
            width: 100%;
            height: 100px;
            bottom: 0;
            right: 0;
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-position: left bottom;
        }
        p {
            font-weight: bold;
            padding-right: 100px;
            font-size: 14px;
        }
        footer h6 {
            padding-right: 100px;
            font-size: 13px;
        }
        .table-style {
            table-layout:fixed;
            width:100%;
        }
        .table-style .long {
            width:100px;
            word-wrap:break-word;
        }
        .table-style tr th {

            text-align: center;
        }
        <!--Advance styling table-->

           #meoravtable,#meoravtd,#meoravth{
                border: 1px solid #ddd;
            }
        .stylingtable{

                border-collapse: collapse;
                width: 100%;

            }
            tr:hover {background-color: #f5f5f5;}

            .stylingthtd {
                    padding: 15px;
                    text-align: right;
            }
        hr.newtable {
            border-bottom: 1px dotted cornsilk  ;
        }


        .pagebreak { page-break-before: always; }

        @media print{

            .noprint{
                display:none !important;
            }
        }
    </style>
    <script>
        function showFiles(){

            setTimeout(function(){
                document.getElementById("attachfiels").style.display="block";
            },1500);

        }
    </script>
</head>
<body style="OVERFLOW: auto !important; HEIGHT: 800px;">
<div style="margin-top: 20px; padding: 50px;">
    <img src="image/print.jpg"  width="42" height="42" align="left" onclick="window.print()" class="noprint">
    <img src="logo_motorolasolutions295213837_trial.jpg">
    <div style="overflow:auto">
        <h1>
            דוח אירוע:
            <td><%out.print(srId);%></td>
        </h1>
        <table>

            <tr>
                <td class="td-caption">מודול: </td>
                <td><%out.print(category);%></td>
            </tr>
            <tr>
                <td class="td-caption">קטגוריה: </td>
                <td><%out.print(subCategory);%> - <%out.print(thirdLevelCategory);%></td>
            </tr>
            <tr>
                <td class="td-caption">תאריך: </td>
                <td><%out.print(insertTime);%></td>
            </tr>
        </table>
        <br />
        <table id = "meoravtable" class="stylingtable">
            <tr>
                <th id="meoravth" class="stylingthtd">מוסד </th>
                <th id="meoravth" class="stylingthtd">יחידה</th>
                <th id="meoravth" class="stylingthtd">מיקום מדוייק </th>
                <th id="meoravth" class="stylingthtd">ת.ז. מעורב</th>
                <th id="meoravth" class="stylingthtd">שם</th>
            </tr>
            <tr>
                <td id="meoravtd" class="stylingthtd"><%out.print(company);%></td>
                <td id="meoravtd" class="stylingthtd"><%out.print(yehida);%></td>
                <td id="meoravtd" class="stylingthtd"><%out.print(mikum);%></td>
                <td id="meoravtd" class="stylingthtd"><%out.print(requestUser);%></td>
                <td id="meoravtd" class="stylingthtd"><%out.print(prati+" "+mishpacha);%></td>
            </tr>

        </table>
        <br/>
        <tr>
            <div  style= "padding: 8px;" class="td-caption">תיאור האירוע:</div>
            <div style= "padding: 15px; white-space: normal;"><%out.print(description);%></div>
        </tr>


        <h4><u>מעורבות קודמת</u></h4>
        <table>

            <!--thead>
               <!--tr>
                  <!--th style="width: 100px;">מספר אירוע</th>
                  <th style="width: 100px;">מודול</th>
                  <th style="width: 100px;">יחידה</th>
                  <th style="width: 100px;">זמן התרחשות</th>
               </tr>
            </thead-->
            <tbody>
            <%
                // get child service records


                try {
                    // conn = DBConnection.getInstance().getConn("motorolaclalit");
                    Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                    ConnectionUrl = "jdbc:sqlserver://localhost:1433;databaseName=sysaid17;user=sa;password=A123456a;";
                    conn=DriverManager.getConnection(ConnectionUrl);
                    stat = conn.prepareStatement("select * from v_print_meorav2 where sr_cust_req_user = ? and id != ? and (sr_sub_type != 17 and sr_sub_type!=19) and sr_cust_req_user !='000000000'");

                    stat.setString(1, requestUser);
                    stat.setInt(2, Integer.parseInt(param));
                    rs = stat.executeQuery();
                    int i = 0;
                    while(rs != null &&  rs.next())  {
                        id = rs.getString("id");
                        title = rs.getString("title");
                        yehida_m = rs.getString("sr_cust_yehida");
                        krot_erua = rs.getString("sr_cust_zman_krot_erua");
                        desc = rs.getString("description");
                        //user = rs.getString("sr_cust_req_user");


                        //if(user!=NULL)
                        //out.print("<tr><td>"+id+"</td><td>"+title+"</td><td>"+yehida+"</td><td>"+krot_erua+"</td><td class=\"long\">"+desc+"</td></tr>");
                        //out.print("<tr><td>"+id+"</td><td>"+title+"</td><td>"+yehida+"</td><td>"+krot_erua+"</td><td class=\"long\"> </td></tr>");
                        //out.print("<tr><td style= width:300px;>" + descTitle + " : " + desc + "</td></tr>");
                        out.print("<tr><td valign=\"top\" style=\"margin-right:10px;margin-left: 5px;  display:inline-block\" class=\"td-caption\"> אירוע:</td> <td style=\"margin-right:10px;margin-left: 5px; display:inline-block\">" + id + "</td></tr>");
                        out.print("<tr><td  valign=\"top\" style=\"margin-right:10px;margin-left: 5px; display:inline-block\" class=\"td-caption\">מודול:</td><td style=\"margin-right:10px;margin-left: 5px; display:inline-block\"> "+ title + "</td></tr>");
                        out.print("<tr><td  valign=\"top\" style=\"margin-right:10px;margin-left: 5px; display:inline-block\" class=\"td-caption\">יחידה:</td><td style=\"margin-right:10px;margin-left: 5px;  display:inline-block\">"+ yehida + "</td></tr>");
                        out.print("<tr><td  valign=\"top\" style=\"margin-right:10px;margin-left: 5px; display:inline-block\" class=\"td-caption\">תאריך:</td><td style=\"margin-right:10px;margin-left: 5px; display:inline-block\"> "+ krot_erua + "</td></tr>");
                        out.print("<tr><td  valign=\"top\" style=\"margin-right:10px;margin-left: 5px; display:inline-block\" class=\"td-caption\">תיאור האירוע:</td></tr>");
                        out.print("<tr><td valign=\"top\" style=\"margin-right:10px;margin-left: 5px;white-space:normal; display:inline-block\">"+description+"</td></tr>");
                        out.print("<tr><td  valign=\"top\" ><hr class=\"newtable\"></td><td><hr class=\"newtable\"></td></tr>");





                    }



                } catch(Exception e) {
                    out.print("=======www>"+e);
                } finally {
                    try {if(rs != null) {rs.close();}} catch(Exception ee) {}
                    try {if(stat != null) {stat.close();}} catch(Exception ee) {}
                    try {if(conn != null) {conn.close();}} catch(Exception ee) {}
                }



            %>
            </tbody>
        </table>
        <div class="pagebreak"> </div>
        <h4><u>פרטי האירוע</u></h4>
        <%
            // get child service records


            try {
                //conn = DBConnection.getInstance().getConn("motorolaclalit");
                Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                ConnectionUrl = "jdbc:sqlserver://localhost:1433;databaseName=sysaid17;user=sa;password=A123456a;";
                conn=DriverManager.getConnection(ConnectionUrl);
                stat = conn.prepareStatement("select * from pirtey_view where id=? ");
                stat.setString(1, param);
                rs = stat.executeQuery();
                int i = 0;
                while(rs != null &&  rs.next())  {

                    rechush = rs.getString("sr_cust_rechush_nignav");
                    erech = rs.getString("sr_cust_erech_prati");
                    erech_k = rs.getString("sr_cust_erech_klalit");
                    hugsha = rs.getInt("sr_cust_hugsha_tluna");
                    mispar_tl = rs.getString("sr_cust_mispar_tluna");
                    tachanat_m = rs.getString("sr_cust_tachanat_mish");
                    yomanait = rs.getString("sr_cust_yomanait");
                    codeworksr = rs.getString("sr_cust_codeworksr");

                }
                if(hugsha==1)
                    hugsha_s="כן";
                else if(hugsha==2)
                    hugsha_s="לא";

            } catch(Exception e) {
                out.print("=======www>"+e);
            } finally {
                try {if(rs != null) {rs.close();}} catch(Exception ee) {}
                try {if(stat != null) {stat.close();}} catch(Exception ee) {}
                try {if(conn != null) {conn.close();}} catch(Exception ee) {}
            }



        %>
        <table>
            <tr>
                <td valign="top" class="td-caption">רכוש שנגנב:</td>
                <td style="white-space: pre-wrap;"><%out.print(rechush);%></td>
            </tr>
            <tr>
                <td class="td-caption">ערך רכוש פרטי: </td>
                <td><%out.print(erech);%></td>
            </tr>
            <tr>
                <td class="td-caption">ערך ש.ב. כללית: </td>
                <td><%out.print(erech_k);%></td>
            </tr>
            <tr>
                <td class="td-caption">   הוגשה תלונה למשטרה :    </td>
                <td><%out.print(hugsha_s);%></td>
            </tr>
            <tr>
                <td class="td-caption">מספר תלונה: </td>
                <td><%out.print(mispar_tl);%></td>
            </tr>
            <tr>
                <td class="td-caption">תחנת משטרה: </td>
                <td><%out.print(tachanat_m);%></td>
            </tr>
            <tr>
                <td class="td-caption">שם יומנאית: </td>
                <td><%out.print(yomanait);%></td>
            </tr>
            <tr>
                <td class="td-caption">קוד נפגע עבירה: </td>
                <td><%out.print(codeworksr);%></td>
            </tr>
        </table>
        <h4><u>מעורבים</u></h4>
        <table id = "meoravtable" class="stylingtable">
            <thead>
            <tr>
                <th id="meoravth" class="stylingthtd">שם משתמש</th>
                <th id="meoravth" class="stylingthtd">שם פרטי</th>
                <th id="meoravth" class="stylingthtd">שם משפחה</th>
                <th id="meoravth" class="stylingthtd">סוג מעורבות</th>
            </tr>
            </thead>
            <tbody>
            <%
                // get child service records


                try {
                    //conn = DBConnection.getInstance().getConn("motorolaclalit");
                    Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                    ConnectionUrl = "jdbc:sqlserver://localhost:1433;databaseName=sysaid17;user=sa;password=A123456a;";
                    conn=DriverManager.getConnection(ConnectionUrl);
                    stat = conn.prepareStatement("select * from meoravim_view where id=? ");
                    stat.setString(1, param);
                    rs = stat.executeQuery();
                    int  isysaiditem = 0;
                    while(rs != null &&  rs.next())  {
                        isysaiditem++;
                        meorav = rs.getString("user_name");
                        s_prati = rs.getString("first_name");
                        s_mish = rs.getString("last_name");
                        sug_m = rs.getString("cause_item");

                        out.print("<tr><td id=\"meoravtd\" class=\"stylingthtd\">"+meorav+"</td><td id=\"meoravtd\" class=\"stylingthtd\">"+s_prati+"</td><td id=\"meoravtd\" class=\"stylingthtd\">"+s_mish+"</td><td id=\"meoravtd\" class=\"stylingthtd\">"+sug_m+"</td></tr>");

                    }
                    if(isysaiditem == 0) {
                        out.print("<tr><td id=\"meoravtd\" class=\"stylingthtd\">"+meorav+"</td><td id=\"meoravtd\" class=\"stylingthtd\">"+s_prati+"</td><td id=\"meoravtd\" class=\"stylingthtd\">"+s_mish+"</td><td id=\"meoravtd\" class=\"stylingthtd\">"+sug_m+"</td></tr>");
                    }


                } catch(Exception e) {
                    out.print("=======www>"+e);
                } finally {
                    try {if(rs != null) {rs.close();}} catch(Exception ee) {}
                    try {if(stat != null) {stat.close();}} catch(Exception ee) {}
                    try {if(conn != null) {conn.close();}} catch(Exception ee) {}
                }



            %>
            </tbody>
        </table>
    </div>
    <div id="attachfiels" style="display: none;">
        <h4><u>קבצים מצורפים</u></h4>
        <table id ="meoravtable" class="stylingtable">
            <tr>
                <th id="meoravth" class="stylingthtd">זמן שיוך הקובץ</th>
                <th id="meoravth" class="stylingthtd">שם הקובץ</th>
            </tr>
            <tbody>
            <%
                // get child service records


                try {
                    //conn = DBConnection.getInstance().getConn("motorolaclalit");
                    Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                    ConnectionUrl = "jdbc:sqlserver://localhost:1433;databaseName=sysaid17;user=sa;password=A123456a;";
                    conn=DriverManager.getConnection(ConnectionUrl);
                    stat = conn.prepareStatement("select * from attachments1 where id=?");
                    stat.setString(1, param);
                    rs = stat.executeQuery();
                    int i = 0;
                    while(rs != null &&  rs.next())  {
            %>
            <script language="javascript">
                showFiles();
            </script>
            <%
                        file_date = rs.getString("file_date");
                        fileName = rs.getString("file_name");
                        out.print("<tr><td id=\"meoravtd\" class=\"stylingthtd\">"+file_date+"</td><td id=\"meoravtd\" class=\"stylingthtd\">"+fileName+"</td></tr>");
                    }


                } catch(Exception e) {
                    out.print("=======www>"+e);
                } finally {
                    try {if(rs != null) {rs.close();}} catch(Exception ee) {}
                    try {if(stat != null) {stat.close();}} catch(Exception ee) {}
                    try {if(conn != null) {conn.close();}} catch(Exception ee) {}
                }



            %>
            </tbody>
        </table>
    </div>
    <%
        // get child service records


        try {
            // conn = DBConnection.getInstance().getConn("motorolaclalit");
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            ConnectionUrl = "jdbc:sqlserver://localhost:1433;databaseName=sysaid17;user=sa;password=A123456a;";
            conn=DriverManager.getConnection(ConnectionUrl);
            stat = conn.prepareStatement("select * from sysaid_user where user_name=? ");
            stat.setString(1, submitUser);
            rs = stat.executeQuery();
            int i = 0;
            if(rs != null && rs.next())  {

                sub_prati = rs.getString("first_name");
                sub_mish = rs.getString("last_name");



            }


        } catch(Exception e) {
            out.print("=======www>"+e);
        } finally {
            try {if(rs != null) {rs.close();}} catch(Exception ee) {}
            try {if(stat != null) {stat.close();}} catch(Exception ee) {}
            try {if(conn != null) {conn.close();}} catch(Exception ee) {}
        }



    %>
</div>
<footer>
    <p>שם מוקדן: <%out.print(sub_prati+" "+sub_mish);%> &nbsp&nbsp&nbsp&nbsp
    <td>חתימה: _______________</td>
    </p>
    <p>הופק ב:  <%out.print(today);%></p>
    <h6>שרותי בריאות כללית <a href="http://clalit.co.il">clalit.co.il</a></h6>
</footer>
</body>
</html>