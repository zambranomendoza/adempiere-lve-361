package com.smj.webui.component;

import java.awt.Color;
import java.awt.Toolkit;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.LinkedList;

import org.compiere.apps.form.Allocation;
import org.compiere.model.MImage;
import org.compiere.report.MReportColumn;
import org.compiere.util.CLogger;
import org.compiere.util.Env;
import org.compiere.util.Msg;

import com.lowagie.text.BadElementException;
import com.lowagie.text.Chunk;
import com.lowagie.text.Document;
import com.lowagie.text.DocumentException;
import com.lowagie.text.ExceptionConverter;
import com.lowagie.text.Font;
import com.lowagie.text.FontFactory;
import com.lowagie.text.PageSize;
import com.lowagie.text.Paragraph;
import com.lowagie.text.Phrase;
import com.lowagie.text.Rectangle;
import com.lowagie.text.pdf.BaseFont;
import com.lowagie.text.pdf.ColumnText;
import com.lowagie.text.pdf.PdfContentByte;
import com.lowagie.text.pdf.PdfPCell;
import com.lowagie.text.pdf.PdfPTable;
import com.lowagie.text.pdf.PdfPageEventHelper;
import com.lowagie.text.pdf.PdfTemplate;
import com.lowagie.text.pdf.PdfWriter;
import com.lowagie.text.Element;
import com.smj.entity.ReportTO;
import com.lowagie.text.Image;

/**
 * @version <li>SmartJSP: SmjPdfReport.java, 2011/03/01
 *          <ul TYPE ="circle">
 *          <li>Crea el PDF de la Tabla T_Report teniendo en cuenta las
 *          prametrizaciones personalizadas
 *          <li>Create PDF Report from T_Report Table. It takes custom settings
 *          for report
 *          </ul>
 * @author Freddy Rodriguez - "SmartJSP" - http://www.smartjsp.com/
 * 
 */
public class SmjPdfReport extends PdfPageEventHelper {

	/** Logger */
	public CLogger log = CLogger.getCLogger(Allocation.class);
	private ByteArrayOutputStream baosPDF;
	private Font titleFont = new Font(Font.HELVETICA, 10, Font.BOLDITALIC);
	private Font titleTableFont = new Font(Font.HELVETICA, 8, Font.BOLDITALIC);
	private Font catFont = new Font(Font.HELVETICA, 12, Font.BOLD);
	private Font subFont = new Font(Font.HELVETICA, 10, Font.NORMAL);
	private int cols = 0;
	private LinkedList<ReportTO> data = null;
	private Document document = null;
	private PdfWriter writer = null;
	private PdfPTable table = null;
	private BaseFont helv;
	private PdfTemplate total;
	private int MarginLeft=20;
	private int MarginRight=20;
	private int MarginTop=95;
	private int MarginBottom=30;
	protected Phrase header;
	protected String Adempiere;
	protected String clitName;
	protected String cliNIT; 
	protected String perName;
	protected String currency;
	String genTitle;
	//Image logo;
	
	
	/**
	 * genera el PDF en un ByteArrayOutputStream ** Generate PDF Report into
	 * ByteArrayOutputStream
	 * 
	 * @return ByteArrayOutputStream
	 */
	public ByteArrayOutputStream generate(LinkedList<ReportTO> dataReport,
			String nameTrx, String[] generalTitle, String clientName,
			String clientNIT, String periodName, String currencyName,
			MReportColumn[] m_columns, String codeFont, String city) {
		baosPDF = new ByteArrayOutputStream();
		data = dataReport;
		String fontPar[] = codeFont.split("-");
		Integer lFont = Integer.parseInt(fontPar[2]);
		titleFont = FontFactory.getFont(fontPar[0], lFont-1, Font.BOLDITALIC);
		titleTableFont = FontFactory.getFont(fontPar[0], lFont-2, Font.BOLDITALIC);
		catFont = FontFactory.getFont(fontPar[0], lFont-2, Font.BOLD);
		subFont = FontFactory.getFont(fontPar[0], lFont-3, Font.NORMAL);
		try {
			document = new Document(PageSize.LETTER, MarginLeft, MarginRight, MarginTop, MarginBottom);// izq-der-arrib
			writer = PdfWriter.getInstance(document, baosPDF);
			writer.setPageEvent(new SmjPdfReport(generalTitle, clientName, clientNIT, periodName, currencyName));
			document.open();
			// metadata del documento
			document.addTitle(generalTitle[0]);
			document.addAuthor("SmartJSP S.A.S.");
			document.addCreator("SmartJSP S.A.S.");
			onOpenDocument(writer, document);
			log.warning("Angel Prueba 1X "+cliNIT);
			//onStartPage(writer, document);
			//onEndPage(writer, document);
			
			
			// Excluye las columnas no imprimibles
			// Edickson Martinez - DCS			
			//m_columns_aux = new MReportColumn[m_columns.length];
			int j=0;
			for (MReportColumn mcolumn:m_columns)
				if(mcolumn.isPrinted())
					j++;
					
					
			cols = j + 2;
			float[] columnWidths = new float[cols];
			columnWidths[0] = 1f;
			columnWidths[1] = 3f;
			
			for (int i = 2; i < cols; i++)				
				columnWidths[i] = 1f;
			
			table = new PdfPTable(columnWidths);
			table.setLockedWidth(false);
			table.setWidthPercentage(100);
			table.setHeaderRows(1);
			// //Titulos de la tabla - Table titles
			// Nombre - name
			PdfPCell cellTitle = new PdfPCell(new Paragraph(Msg.translate(Env.getCtx(), "name").toUpperCase(), catFont));
			cellTitle.setHorizontalAlignment(Paragraph.ALIGN_LEFT);
			cellTitle.setBackgroundColor(Color.LIGHT_GRAY);
			table.addCell(cellTitle);
			// Desripcion - description
			cellTitle = new PdfPCell(new Paragraph(Msg.translate(Env.getCtx(), "description").toUpperCase(), catFont));
			cellTitle.setHorizontalAlignment(Paragraph.ALIGN_LEFT);
			cellTitle.setBackgroundColor(Color.LIGHT_GRAY);
			table.addCell(cellTitle);
			// columnas de valores - Value Columns
			for (MReportColumn mcol:m_columns){
					if(mcol.isPrinted()){
						String colName = mcol.getName();
						cellTitle = new PdfPCell(new Paragraph(colName.toUpperCase(), catFont));
						cellTitle.setHorizontalAlignment(Paragraph.ALIGN_RIGHT);
						cellTitle.setBackgroundColor(Color.LIGHT_GRAY);
						table.addCell(cellTitle);
					}
			}//for columnas

			// TABLA DEL REPORTE - REPORT TABLE
			reportTable(m_columns);
			document.add(table);

			// funciones que ponen el pie del porte - put footer
			//onEndPage(writer, document);
			//onCloseDocument(writer, document);
			document.close();
		} catch (Exception e) {
			System.out
					.println("SMpdfReport(generar)ERROR:: al crear el documento PDF");
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
		return baosPDF;
	}// generar
	
	public SmjPdfReport(){
		header = new Phrase("**** THIS IS HEADER PART OF THIS PDF ****");
	}

	public SmjPdfReport(String[] generalTitle, String clientName, String clientNIT, String periodName, String currencyName) {
		
		// Adempiere
		Adempiere = new String("ADEMPIERE");
		
		//CLIENTNAME
		clitName = new String(dataNull(clientName).toUpperCase());
		log.warning("Prueba clitName"+clitName);
		
		// NIT
		cliNIT = new String("RIF: "+dataNull(clientNIT).toUpperCase());
		
		// Titulo General - general Title
		genTitle = new String(dataNull(generalTitle[0]).toUpperCase());
		// periodo - Period
		String pn = "";
		if (generalTitle[1]!=null && generalTitle[1].length()>0){
			pn = generalTitle[1]+" "+periodName;
		}else{
			pn = periodName;
		}
		if (generalTitle[2]!=null && generalTitle[2].length()>0){
			pn = pn+" "+generalTitle[2];
		}
		perName = new String(dataNull(pn).toUpperCase());
		// tipo moneda - currency
		currency = new String("Moneda: "+dataNull(currencyName));
		
		// //////////////////////////////////////////////////////////////////////////////////////
		// agrega el logo
		// add logo
		/*java.awt.Image img;
		if (logoId > 0) {
			MImage mimage = MImage.get(Env.getCtx(), logoId);
			byte[] imageData = mimage.getData();
			img = Toolkit.getDefaultToolkit().createImage(imageData);
			log.warning("Prueba Imagen "+img);
		} else {
			img = org.compiere.Adempiere.getImageLogoSmall(true); // 48x15
		}
		try {
			logo = Image.getInstance(img, null);
			logo.scaleToFit(100, 30);
		} catch (BadElementException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}*/
		
	}
	/**
	 * coloca la tabla en el reporte ** Put table in report
	 */
	public void reportTable(MReportColumn[] m_columns) {
		PdfPCell tableCell;
		Iterator<ReportTO> itRep = data.iterator();
		while (itRep.hasNext()) {
			ReportTO rpt = itRep.next();
			if (rpt.getSmj_reportline() != null	&& rpt.getSmj_reportline().equals("T")) {
				// Coloca titulo - put title
				PdfPCell title = new PdfPCell(new Paragraph(dataNull(rpt.getDescription()), titleTableFont));
				title.setColspan(cols);
				title.setHorizontalAlignment(Paragraph.ALIGN_CENTER);
				title.setBorder(0);
				table.addCell(title);
			} else if (rpt.getSmj_reportline() != null && rpt.getSmj_reportline().equals("L")) {
				// coloca linea en el reporte - Put under line in the report
				PdfPCell line = new PdfPCell(new Paragraph("", subFont));
				line.setColspan(cols);
				line.setBorderWidthLeft(0);
				line.setBorderWidthRight(0);
				line.setBorderWidthTop(0);
				line.setBorderColorBottom(Color.BLACK);
				table.addCell(line);
			} else if (rpt.getSmj_reportline() != null	&& rpt.getSmj_reportline().equals("X")) {
				// coloca linea de total - Put total line
				 simpleLine();
			} else if (rpt.getSmj_reportline() != null	&& rpt.getSmj_reportline().equals("Z")) {
				// coloca linea doble de total - Put total line doble
				for(int j=0; j< 2;j++){
				 simpleLine();
				}
			} else if (rpt.getSmj_reportline() != null && rpt.getSmj_reportline().equals("D")) {
				// coloca liena de descripcion - put description line
				tableCell = new PdfPCell(new Phrase(""));
				tableCell.setBorder(0);
				table.addCell(tableCell);
				tableCell = new PdfPCell(new Phrase(""));
				tableCell.setBorderWidthLeft(0);
				tableCell.setBorderWidthRight(0);
				tableCell.setBorderWidthTop(0);
				tableCell.setBorderColorBottom(Color.BLACK);
				table.addCell(tableCell);
				for (int i = 0; i < (cols - 2); i++) {
					tableCell = new PdfPCell(new Phrase(""));
					tableCell.setBorder(0);
					table.addCell(tableCell);
				}// for
			} else if (rpt.getSmj_reportline() != null && rpt.getSmj_reportline().equals("S")) {
				// coloca linea en blanco - put empty line
				PdfPCell line = new PdfPCell(new Paragraph("         "));
				line.setColspan(cols);
				line.setBorder(0);
				table.addCell(line);
			} else if (rpt.getSmj_hierarchylevel() != null && rpt.getSmj_hierarchylevel() > 0) {
				// coloca espacios a la izquierda para simular jeraquia - put
				// left spaces to simulate hierarchy
				String jerarchy = "";
				for (int i = 1; i <= rpt.getSmj_hierarchylevel(); i++) {
					jerarchy = jerarchy + "   ";
				}
				PdfPCell line = new PdfPCell(new Paragraph(jerarchy
						+ dataNull(rpt.getDescription()), catFont));
				line.setColspan(cols);
				line.setHorizontalAlignment(Paragraph.ALIGN_LEFT);
				line.setBorder(0);
				table.addCell(line);
			} else {
				if (rpt.getDescription() != null) {
					// nombre - name
					tableCell = new PdfPCell(new Phrase(
							dataNull(rpt.getName()), subFont));
					tableCell.setBorder(0);
					tableCell.setHorizontalAlignment(Paragraph.ALIGN_LEFT);
					table.addCell(tableCell);
					// descripcion - description
					tableCell = new PdfPCell(new Phrase(
							dataNull(rpt.getDescription().toUpperCase()), subFont));
					tableCell.setBorder(0);
					table.addCell(tableCell);
					// columnas 0 a 20 - cols 0 to 20
					if (m_columns.length >= 1 && m_columns[0].isPrinted()) {
						tableCell = new PdfPCell(new Phrase(formatValue(rpt.getCol_0()), subFont));
						tableCell.setBorder(0);
						tableCell.setHorizontalAlignment(Paragraph.ALIGN_RIGHT);
						table.addCell(tableCell);
					}
					if (m_columns.length >= 2 && m_columns[1].isPrinted()) {
						tableCell = new PdfPCell(new Phrase(formatValue(rpt.getCol_1()), subFont));
						tableCell.setBorder(0);
						tableCell.setHorizontalAlignment(Paragraph.ALIGN_RIGHT);
						table.addCell(tableCell);
					}
					if (m_columns.length >= 3 && m_columns[2].isPrinted()) {
						tableCell = new PdfPCell(new Phrase(formatValue(rpt.getCol_2()), subFont));
						tableCell.setBorder(0);
						tableCell.setHorizontalAlignment(Paragraph.ALIGN_RIGHT);
						table.addCell(tableCell);
					}
					if (m_columns.length >= 4 && m_columns[3].isPrinted()) {
						tableCell = new PdfPCell(new Phrase(formatValue(rpt.getCol_3()), subFont));
						tableCell.setBorder(0);
						tableCell.setHorizontalAlignment(Paragraph.ALIGN_RIGHT);
						table.addCell(tableCell);
					}
					if (m_columns.length >= 5 && m_columns[4].isPrinted()) {
						tableCell = new PdfPCell(new Phrase(formatValue(rpt.getCol_4()), subFont));
						tableCell.setBorder(0);
						tableCell.setHorizontalAlignment(Paragraph.ALIGN_RIGHT);
						table.addCell(tableCell);
					}
					if (m_columns.length >= 6 && m_columns[5].isPrinted()) {
						tableCell = new PdfPCell(new Phrase(formatValue(rpt.getCol_5()), subFont));
						tableCell.setBorder(0);
						tableCell.setHorizontalAlignment(Paragraph.ALIGN_RIGHT);
						table.addCell(tableCell);
					}
					if (m_columns.length >= 7 && m_columns[6].isPrinted()) {
						tableCell = new PdfPCell(new Phrase(formatValue(rpt.getCol_6()), subFont));
						tableCell.setBorder(0);
						tableCell.setHorizontalAlignment(Paragraph.ALIGN_RIGHT);
						table.addCell(tableCell);
					}
					if (m_columns.length >= 8 && m_columns[7].isPrinted()) {
						tableCell = new PdfPCell(new Phrase(formatValue(rpt.getCol_7()), subFont));
						tableCell.setBorder(0);
						tableCell.setHorizontalAlignment(Paragraph.ALIGN_RIGHT);
						table.addCell(tableCell);
					}
					if (m_columns.length >= 9 && m_columns[8].isPrinted()) {
						tableCell = new PdfPCell(new Phrase(formatValue(rpt.getCol_8()), subFont));
						tableCell.setBorder(0);
						tableCell.setHorizontalAlignment(Paragraph.ALIGN_RIGHT);
						table.addCell(tableCell);
					}
					if (m_columns.length >= 10 && m_columns[9].isPrinted()) {
						tableCell = new PdfPCell(new Phrase(formatValue(rpt.getCol_9()), subFont));
						tableCell.setBorder(0);
						tableCell.setHorizontalAlignment(Paragraph.ALIGN_RIGHT);
						table.addCell(tableCell);
					}
					if (m_columns.length >= 11 && m_columns[10].isPrinted()) {
						tableCell = new PdfPCell(new Phrase(formatValue(rpt.getCol_10()), subFont));
						tableCell.setBorder(0);
						tableCell.setHorizontalAlignment(Paragraph.ALIGN_RIGHT);
						table.addCell(tableCell);
					}
					if (m_columns.length >= 12 && m_columns[11].isPrinted()) {
						tableCell = new PdfPCell(new Phrase(formatValue(rpt.getCol_11()), subFont));
						tableCell.setBorder(0);
						tableCell.setHorizontalAlignment(Paragraph.ALIGN_RIGHT);
						table.addCell(tableCell);
					}
					if (m_columns.length >= 13 && m_columns[12].isPrinted()) {
						tableCell = new PdfPCell(new Phrase(formatValue(rpt.getCol_12()), subFont));
						tableCell.setBorder(0);
						tableCell.setHorizontalAlignment(Paragraph.ALIGN_RIGHT);
						table.addCell(tableCell);
					}
					if (m_columns.length >= 14 && m_columns[13].isPrinted()) {
						tableCell = new PdfPCell(new Phrase(formatValue(rpt.getCol_13()), subFont));
						tableCell.setBorder(0);
						tableCell.setHorizontalAlignment(Paragraph.ALIGN_RIGHT);
						table.addCell(tableCell);
					}
					if (m_columns.length >= 15 && m_columns[14].isPrinted()) {
						tableCell = new PdfPCell(new Phrase(formatValue(rpt.getCol_14()), subFont));
						tableCell.setBorder(0);
						tableCell.setHorizontalAlignment(Paragraph.ALIGN_RIGHT);
						table.addCell(tableCell);
					}
					if (m_columns.length >= 16 && m_columns[15].isPrinted()) {
						tableCell = new PdfPCell(new Phrase(formatValue(rpt.getCol_15()), subFont));
						tableCell.setBorder(0);
						tableCell.setHorizontalAlignment(Paragraph.ALIGN_RIGHT);
						table.addCell(tableCell);
					}
					if (m_columns.length >= 17 && m_columns[16].isPrinted()) {
						tableCell = new PdfPCell(new Phrase(formatValue(rpt.getCol_16()), subFont));
						tableCell.setBorder(0);
						tableCell.setHorizontalAlignment(Paragraph.ALIGN_RIGHT);
						table.addCell(tableCell);
					}
					if (m_columns.length >= 18 && m_columns[17].isPrinted()) {
						tableCell = new PdfPCell(new Phrase(formatValue(rpt.getCol_17()), subFont));
						tableCell.setBorder(0);
						tableCell.setHorizontalAlignment(Paragraph.ALIGN_RIGHT);
						table.addCell(tableCell);
					}
					if (m_columns.length >= 19 && m_columns[18].isPrinted()) {
						tableCell = new PdfPCell(new Phrase(formatValue(rpt.getCol_18()), subFont));
						tableCell.setBorder(0);
						tableCell.setHorizontalAlignment(Paragraph.ALIGN_RIGHT);
						table.addCell(tableCell);
					}
					if (m_columns.length >= 20 && m_columns[19].isPrinted()) {
						tableCell = new PdfPCell(new Phrase(formatValue(rpt.getCol_19()), subFont));
						tableCell.setBorder(0);
						tableCell.setHorizontalAlignment(Paragraph.ALIGN_RIGHT);
						table.addCell(tableCell);
					}
					if (m_columns.length >= 21 && m_columns[20].isPrinted()) {
						tableCell = new PdfPCell(new Phrase(formatValue(rpt.getCol_20()), subFont));
						tableCell.setBorder(0);
						tableCell.setHorizontalAlignment(Paragraph.ALIGN_RIGHT);
						table.addCell(tableCell);
					}
				}// if description NO null
			}// final else
		}// while
	}// bodyReport

	/**
	 * coloca linea de total - Put total line
	 */
	private void simpleLine(){
		PdfPCell tableCell = new PdfPCell(new Phrase(""));
		tableCell.setBorder(0);
		table.addCell(tableCell);
		tableCell = new PdfPCell(new Phrase(""));
		tableCell.setBorder(0);
		table.addCell(tableCell);
		for (int i = 0; i < (cols - 2); i++) {
			tableCell = new PdfPCell(new Phrase(""));
			tableCell.setBorderWidthLeft(0);
			tableCell.setBorderWidthRight(0);
			tableCell.setBorderWidthTop(0);
			tableCell.setBorderColorBottom(Color.BLACK);
			table.addCell(tableCell);
			
		}// for
	}//simpleLine
	
	/**
	 * predefine los valores del pie de pagina
	 * in all pages
	 * @param writer
	 * @param document
	 */
	public void onOpenDocument(PdfWriter writer, Document document) {
		total = writer.getDirectContent().createTemplate(100, 100);
		total.setBoundingBox(new Rectangle(-20, -20, 100, 100));
		
		try {
			helv = BaseFont.createFont(BaseFont.HELVETICA, BaseFont.WINANSI, BaseFont.NOT_EMBEDDED);
		} catch (Exception e) {
			throw new ExceptionConverter(e);
		}
	}// onOpenDocument

	/**
	 * define el pie de pagina a colocar en las paginas ** define footer to put
	 * in all pages
	 * @param writer
	 * @param document
	 */
	public void onEndPage(PdfWriter writer, Document document) {
		
		PdfContentByte cb = writer.getDirectContentUnder();		
		cb.saveState();
		Date date = new Date();
		String textRight = date.getDate()+"-"+(date.getMonth()+1)+"-"+(date.getYear()+1900) + "  /  " + "Pagina "+ writer.getPageNumber() + " de ";
		float textBase = document.bottom() - 10;
		float textSizeRigth = helv.getWidthPoint(textRight, 8);
		/*try {
			cb.addImage(logo, logo.getWidth(), 0, 0, logo.getHeight(), document.left(), document.top() + 60);
		} catch (DocumentException e) {
			// TODO Bloque catch generado automáticamente
			e.printStackTrace();
		}*/
		cb.beginText();
		Chunk CAux = new Chunk(Adempiere);
		CAux.setFont(titleFont);
		Phrase PAux = new Phrase(CAux);
		ColumnText.showTextAligned(cb, Element.ALIGN_LEFT, PAux,document.leftMargin(), document.top() + 75, 0);
		CAux = new Chunk(clitName);
		CAux.setFont(titleFont);
		PAux = new Phrase(CAux);
		ColumnText.showTextAligned(cb, Element.ALIGN_LEFT, PAux,document.leftMargin(), document.top() + 63, 0);
		CAux = new Chunk(cliNIT);
		CAux.setFont(titleFont);
		PAux = new Phrase(CAux);
		ColumnText.showTextAligned(cb, Element.ALIGN_LEFT, PAux,document.leftMargin(), document.top() + 51, 0);
		CAux = new Chunk(genTitle);
		CAux.setFont(titleFont);
		PAux = new Phrase(CAux);
		ColumnText.showTextAligned(cb, Element.ALIGN_CENTER, PAux, (document.right() - document.left()) / 2 + document.leftMargin(), document.top() + 30, 0);
		CAux = new Chunk(perName);
		CAux.setFont(titleTableFont);
		PAux = new Phrase(CAux);
		ColumnText.showTextAligned(cb, Element.ALIGN_CENTER, PAux, (document.right() - document.left()) / 2 + document.leftMargin(), document.top() + 19, 0);
		CAux = new Chunk(currency);
		CAux.setFont(titleTableFont);
		PAux = new Phrase(CAux);
		ColumnText.showTextAligned(cb, Element.ALIGN_CENTER, PAux, (document.right() - document.left()) / 2 + document.leftMargin(), document.top() + 8, 0);
		cb.setFontAndSize(helv, 8);
		float adjust = helv.getWidthPoint("    ", 8);
	    cb.setTextMatrix(document.right() - textSizeRigth - adjust,	textBase);
		cb.showText(textRight);
		cb.endText();
		cb.addTemplate(total, document.right() - adjust, textBase);		
		
		
		cb.restoreState();
	}
	
	
	/**
	 * coloca la pagina total en el pie de pagina ** put total number page in footer
	 * 
	 * @param writer
	 * @param document
	 */
	public void onCloseDocument(PdfWriter writer, Document document) {
		total.beginText();
		total.setFontAndSize(helv, 8);
		total.setTextMatrix(0, 0);
		total.showText(String.valueOf(writer.getPageNumber()-1));
		total.endText();
	}// onCloseDocument

	/**
	 * Crea el archivo PDF a partir de un Byte[] ** Create PDF File from a Byte[]
	 * @param buf
	 * @param generalTitle
	 * @return File
	 */
	public File tofile(byte[] buf, String[] generalTitle) {
		byte[] bytes = buf;

		File file = new File(generalTitle[0]+".pdf");
		FileOutputStream fos;
		try {
			fos = new FileOutputStream(file);
			fos.write(bytes);
			fos.flush();
			fos.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return file;
	}// tofile

	/**
	 * Crea un salto de linea ** Create a line Break
	 */
	private void addEmptyLine(Paragraph paragraph, int number) {
		for (int i = 0; i < number; i++) {
			paragraph.add(new Paragraph(" "));
		}
	}// addEmptyLine

	/**
	 * Regresa un string libre de datos nulos **
	 * returns String without null
	 * @param data
	 * @return
	 */
	private String dataNull(String data) {
		if (data == null)
			return "";
		else
			return data;
	}// addEmptyLine
	
	/**
	 * regresa el valor formateado a dos caracteres
	 * returns value format 2 characters
	 * @param data
	 * @return String
	 */
	private String formatValue(BigDecimal data) {
		if (data == null)
			return "";
		else{
			DecimalFormat frm = new DecimalFormat("###,###,###,##0.00");
			return frm.format(data.setScale(2));
		}
	}// formatValue

}// SMpdfReport
	
	
	
	
	