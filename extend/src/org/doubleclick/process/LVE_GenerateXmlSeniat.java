/**
 * 
 */
package org.doubleclick.process;

import java.awt.Desktop;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.math.BigDecimal;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.logging.Level;
import org.compiere.process.ProcessInfoParameter;
import org.compiere.process.SvrProcess;
import org.compiere.util.DB;
import org.jdom.Document;
import org.jdom.Element;
import org.jdom.output.Format;
import org.jdom.output.XMLOutputter;
import org.jdom.Content;
import org.zkoss.*;
import org.zkoss.zul.Filedownload;


/**
 * Localizacion Venezuela
 * LVE_GenerateXmlSeniat
 * @author Victor Suarez  -  vsuarez@dcsla.com  - Double Click Sistemas C.A.
 * 24-05-2012
 *
 */
public class LVE_GenerateXmlSeniat extends SvrProcess {

	/**
	 * 
	 */
	public LVE_GenerateXmlSeniat() {
		// TODO Auto-generated constructor stub
	}
	
	/**Organization                  */
	private BigDecimal	p_AD_Org_ID = null;	
	/** ValidFrom               */
	private Timestamp 	p_ValidFrom=null;
	/** ValidTo                 */
	private Timestamp   p_ValidTo=null;

	/* (non-Javadoc)
	 * @see org.compiere.process.SvrProcess#prepare()
	 */
	@Override
	protected void prepare() {
		// TODO Auto-generated method stub

		ProcessInfoParameter[] para = getParameter();
		for (int i = 0; i < para.length; i++)
		{
			String name = para[i].getParameterName();
			if (para[i].getParameter() == null)
				;
			else if (name.equals("AD_Org_ID"))
				p_AD_Org_ID= (BigDecimal) para[i].getParameter();
			else if (name.equals("ValidFrom"))
				p_ValidFrom=(Timestamp) para[i].getParameter();
			else if (name.equals("ValidTo"))
				p_ValidTo=(Timestamp) para[i].getParameter();
			
			else
				log.log(Level.SEVERE, "Unknown Parameter: " + name);
		}
		
	}

	/* (non-Javadoc)
	 * @see org.compiere.process.SvrProcess#doIt()
	 */
	@Override
	protected String doIt() throws Exception {
		// TODO Auto-generated method stub
		
		String sql="";
		Element root=new Element("RelacionRetencionesISLR");
		String separador=System.getProperty("file.separator");
		String dir=System.getProperty("user.dir");
		String so=System.getProperty("os.name");
		String sPath=separador+dir+separador;
		String nombreAr="XML_relacionRetencionesISLR.xml";
		FileOutputStream file=new FileOutputStream(nombreAr);
	   
		sql=("SELECT *"
				+ " FROM lve_xmlislr " 
				+ " WHERE " 
				+ " lve_xmlislr.org = '" + p_AD_Org_ID + "' AND "
				+ " (lve_xmlislr.fecha BETWEEN '" + p_ValidFrom + "' AND '"+ p_ValidTo +"')" 
				);
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
	try {
		pstmt = DB.prepareStatement(sql, null);
		rs = pstmt.executeQuery();
		
		while (rs.next())
		{
				root.setAttribute("RifAgente", rs.getString(8).trim());
				root.setAttribute("Periodo", rs.getString(9).trim());
			    		    
		//  Creamos un hijo para el root
				 Element detalleRetencion=new Element("DetalleRetencion");
			    detalleRetencion.addContent(new Element("RifRetenido").setText(rs.getString(1).trim()));
			    detalleRetencion.addContent(new Element("NumeroFactura").setText(rs.getString(2).trim()));
			    detalleRetencion.addContent(new Element("NumeroControl").setText(rs.getString(3).trim()));
			    detalleRetencion.addContent(new Element("CodigoConcepto").setText(rs.getString(4).trim()));
			    detalleRetencion.addContent(new Element("MontoOperacion").setText(rs.getString(5).trim()));
			    detalleRetencion.addContent(new Element("PorcentajeRetencion").setText(rs.getString(6).trim()));
			    
			    root.addContent(detalleRetencion);
		    			      
			//   //Agregamos al root
			}
		}	
		catch ( Exception e )
        {
            System.out.println(e.getMessage());
        }
		
		
		pstmt.close();
		
	 //Creamos el documento
		Document doc=new Document(root);
		
		try{	
		      Format format = Format.getPrettyFormat();
		      format.setEncoding("ISO-8859-1");
		      XMLOutputter out=new XMLOutputter();
		      out.setFormat(format);
		      out.output(doc,file);
		      file.flush();
		      file.close();
			
		    }catch(Exception e){e.printStackTrace();}
		
		File archivoXML=new File(nombreAr);
		
		if(Desktop.isDesktopSupported()==true) {
			Desktop desktop = Desktop.getDesktop();
			try {
				if(archivoXML.exists()==true) {
					desktop.open(archivoXML);
				}
				else{
				return "Error..... Archivo no pudo ser generado";
			}
			}
			catch (IOException e) {

			}
			}
			else {
			return "Archivo no pudo ser generado en este sistema operativo: " + so;
			}
		
		    
	return "Archivo " + nombreAr +" generado exitosamente en " + dir;

	}
}
