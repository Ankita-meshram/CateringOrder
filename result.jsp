<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Saved Records</title>
    <style>
        body {
            font-family: Arial;
            background: #f4f7fb;
            color: #1f3864;
        }
        h2 { text-align: center; }
        table {
            border-collapse: collapse;
            width: 80%;
            margin: auto;
            background: white;
        }
        th {
            background: #1f3864;
            color: white;
            padding: 8px;
        }
        td {
            border: 1px solid #888;
            padding: 7px;
            text-align: center;
            color: black;
        }
        p { text-align: center; }
    </style>
</head>
<body>

<%
String customer = request.getParameter("customer");
String event = request.getParameter("event");
String plates = request.getParameter("plates");
String rate_per_plates = request.getParameter("rate_per_plates");

String url = "jdbc:mysql://localhost:3306/cateringdb";
String dbUser = "root";
String dbPassword = "root123";

try {
    Class.forName("com.mysql.cj.jdbc.Driver");

    try (Connection con = DriverManager.getConnection(
            url, dbUser, dbPassword)) {

            String sql =
                "INSERT INTO city (customer, event, plates, rate per unit) VALUES (?, ?, ?, ?)";

            try (PreparedStatement ps = con.prepareStatement(sql)) {
                ps.setString(1, customer);
                ps.setString(2, event);
                ps.setString(3, plates);
                ps.setString(4, rate per unit);
                ps.executeUpdate();
            }
        }
%>

<h2>Saved! All Records</h2>

<table>
    <tr>
        <th>Customer</th>
        <th>Event</th>
        <th>Plates</th>
        <th>Rate Per Unit</th>
        <th>Total Bill(Rs.)</th>
    </tr>

<%
        String sql = "SELECT customer, event, plates, rate per unit state FROM catering ORDER BY id";

        try (Statement st = con.createStatement();
             ResultSet rs = st.executeQuery(sql)) {

            while (rs.next()) {
%>
    <tr>
        <td><%= rs.getInt("customer") %></td>
        <td><%= rs.getString("event") %></td>
        <td><%= rs.getString("plates") %></td>
        <td><%= rs.getString("rate per plates") %></td>
        <td><%= rs.getString("total bill") %></td>
    </tr>
<%
            }
        }
    }
%>
</table>

</body>
</html>
