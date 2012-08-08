package org.doubleclick.process;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;

import org.compiere.process.ProcessInfoParameter;
import org.compiere.process.SvrProcess;
import org.compiere.util.DB;

import java.io.*;
import java.math.BigDecimal;
import java.util.logging.Level;
import java.awt.Desktop;


/**
 * Localizacion Venezuela
 * LVE_GenerateTxtSeniat
 * @author Victor Suarez  -  vsuarez@dcsla.com  - Double Click Sistemas C.A.
 * 22-05-2012
 *
 */
public class LVE_GenerateTxtSeniat extends SvrProcess {

	public LVE_GenerateTxtSeniat() {
		// TODO Auto-generated constructor stub
		
		
	}
	/**	Org						*/
	private BigDecimal	p_AD_Org_ID = null;	
	/** ValidFrom               */
	private Timestamp 	p_ValidFrom=null;
	/** ValidTo                 */
	private Timestamp   p_ValidTo=null;
	/** tipooperacion           */
	private String      p_TipoOperacion=null;
	
	
	
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
				p_AD_Org_ID=(BigDecimal) para[i].getParameter();
			else if (name.equals("TipoOperacion"))
				p_TipoOperacion = ((String) para[i].getParameter());
			else if (name.equals("ValidFrom"))
				p_ValidFrom=(Timestamp) para[i].getParameter();
			else if (name.equals("ValidTo"))
				p_ValidTo=(Timestamp) para[i].getParameter();
			
			else
				log.log(Level.SEVERE, "Unknown Parameter: " + name);
		}

	}

	@Override
	protected String doIt() throws Exception {
		// TODO Auto-generated method stub
		String sql="";
		String so=System.getProperty("os.name");
		//String separador=System.getProperty("file.separator");
		String dir=System.getProperty("user.dir");
		String nombreArch="TXT_Seniat.txt";
		File archivo=new File(nombreArch);
				
    
		sql=("SELECT *"
				+ " FROM lve_txtiva " 
				+ " WHERE " 
				+ " lve_txtiva.org = '" + p_AD_Org_ID + "' AND "
				+ " (lve_txtiva.fechareten BETWEEN '" + p_ValidFrom + "' AND '"+ p_ValidTo +"') AND"
				+ " lve_txtiva.tipooperacion= '" + p_TipoOperacion + "' " 
				);
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		BufferedWriter writer = new BufferedWriter(new FileWriter(archivo));
		try {
			pstmt = DB.prepareStatement(sql, null);
			rs = pstmt.executeQuery();
			while (rs.next())
			{
			writer.write(rs.getString(1).trim()+"	"+rs.getString(2).trim()+"	"+rs.getString(3).trim()+"	"+rs.getString(4).trim()
						+"	"+rs.getString(5).trim()+"	"+rs.getString(6).trim()+"	"+rs.getString(7).trim()+"	"+rs.getString(8).trim()+"	"+rs.getString(9).trim()
						+"	"+rs.getString(10).trim()+"	"+rs.getString(11).trim()+"	"+rs.getString(12).trim()+"	"+rs.getString(13).trim()+"	"+rs.getString(14).trim()+"	"+rs.getString(15).trim()+"	"+rs.getString(16).trim());	
			writer.newLine();
			}
			pstmt.close();
			
		writer.close();
		}
		catch ( Exception e )
        {
            System.out.println(e.getMessage());
        }
		
		if(Desktop.isDesktopSupported()==true) {
			Desktop desktop = Desktop.getDesktop();
			try {
				if(archivo.exists()==true) {
					desktop.open(archivo);
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

return "Archivo " + nombreArch + " ha sido Generado Exitosamente en: "+dir;

}
		
}

