<%
double price = 100; // sample
int qty = Integer.parseInt(request.getParameter("qty"));
double total = price * qty;
%>

<h3>Total Amount: ₹<%= total %></h3>
<button>Generate Invoice</button>
