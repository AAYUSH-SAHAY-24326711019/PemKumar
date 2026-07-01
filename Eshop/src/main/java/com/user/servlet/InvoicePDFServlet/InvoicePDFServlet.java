package com.user.servlet.InvoicePDFServlet;

import java.io.IOException;
import java.util.List;

import com.DAO.OrderDAO;
import com.DB.DBConnect;
import com.entity.Order;
import com.entity.OrderItem;

import com.lowagie.text.Document;
import com.lowagie.text.Element;
import com.lowagie.text.Font;
import com.lowagie.text.Paragraph;

import com.lowagie.text.pdf.PdfPTable;
import com.lowagie.text.pdf.PdfWriter;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/invoice")
public class InvoicePDFServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws IOException {

        try {

            HttpSession session =
            request.getSession();

            Integer orderId =
            (Integer)session.getAttribute(
            "lastOrderId");

            if(orderId == null) {

                response.getWriter()
                .println("Order Not Found");

                return;
            }

            OrderDAO dao =
            new OrderDAO(DBConnect.getConn());

            Order order =
            dao.getOrderById(orderId);

            List<OrderItem> items =
            dao.getOrderItems(orderId);

            response.setContentType(
            "application/pdf");

            response.setHeader(
            "Content-Disposition",
            "attachment; filename=Invoice_"
            + order.getInvoiceNo()
            + ".pdf");

            Document document =
            new Document();

            PdfWriter.getInstance(
            document,
            response.getOutputStream());

            document.open();

            Font title =
            new Font(
            Font.HELVETICA,
            18,
            Font.BOLD);

            Paragraph heading =
            new Paragraph(
            "E-Shop Invoice",
            title);

            heading.setAlignment(
            Element.ALIGN_CENTER);

            document.add(heading);

            document.add(
            new Paragraph(" "));

            document.add(
            new Paragraph(
            "Invoice No : "
            + order.getInvoiceNo()));

            document.add(
            new Paragraph(
            "Customer : "
            + order.getCustomerName()));

            document.add(
            new Paragraph(
            "Phone : "
            + order.getPhone()));

            document.add(
            new Paragraph(
            "Payment : "
            + order.getPaymentMethod()));

            document.add(
            new Paragraph(
            "Date : "
            + order.getOrderDate()));

            document.add(
            new Paragraph(" "));

            PdfPTable table =
            new PdfPTable(4);

            table.setWidthPercentage(100);

            table.addCell("Product");
            table.addCell("Qty");
            table.addCell("Price");
            table.addCell("Subtotal");

            for(OrderItem item : items) {

                table.addCell(
                item.getProductName());

                table.addCell(
                String.valueOf(
                item.getQuantity()));

                table.addCell(
                String.valueOf(
                item.getUnitPrice()));

                table.addCell(
                String.valueOf(
                item.getSubtotal()));
            }

            document.add(table);

            document.add(
            new Paragraph(" "));

            Paragraph total =
            new Paragraph(

            "Total Amount : ₹ "
            + order.getTotalAmount(),

            new Font(
            Font.HELVETICA,
            14,
            Font.BOLD)

            );

            total.setAlignment(
            Element.ALIGN_RIGHT);

            document.add(total);

            document.close();

        } catch(Exception e) {

            e.printStackTrace();
        }
    }
}