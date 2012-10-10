package org.doubleclick.callout;

import java.util.Properties;

import org.adempiere.webui.window.FDialog;
import org.compiere.model.CalloutEngine;  	
import org.compiere.model.GridField;     	
import org.compiere.model.GridTab;  
import org.compiere.model.MSysConfig;
import org.compiere.util.AdempiereSystemError; 	
import org.compiere.util.Env;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.net.URL;

import javax.swing.JOptionPane;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;



/**
 *	Validator for LVE_ValidationSENIAT
 *	
 * @author Rafael Salazar C. - rsalazar@dcsla.com - rtsc08@gmail.com , Double Click Sistemas http://www.dcsla.com
 * 
 * @contributor Miguel Hernández Giusti - mhernandez@ghintech.com, Ghintech de Venezuela http://www.ghintech.com
 */ 

public class LVE_ValidationSENIAT extends CalloutEngine{

	
	public String test(Properties ctx, int windowNo, GridTab mTab, GridField mField, Object value) throws AdempiereSystemError { 

			  log.fine("test callout"); 
			  log.fine("tab name: " + mTab.getName()); 
			  log.fine("window no: " + windowNo); 
			  log.fine("window name: " + Env.getWindow(windowNo).getName()); 

			  return "this is a return string"; 
	} 

	public String validation (Properties ctx, int WindowNo, GridTab mTab, GridField mField, Object value) throws InterruptedException
	{
		if (isCalloutActive())
			return "";
		
		String url = getUrlSeniat();
		
		String rif =String.valueOf(	mTab.getValue("taxid")).replaceAll("-", "");
		
		if (rif.equals("null"))
			return "";

		try {

			
			String rifAux=rif;
		    BufferedReader br =this.existe(url+rif);
		   if (br== null && rif.length()<10 && ( rif.substring(0, 1).toUpperCase().equals("V") ||rif.substring(0, 1).toUpperCase().equals("E"))  ){
//			   if (Messagebox.show("Â¿Desea que el sistema busque posibles Terceros?", "Pregunta",
//						Messagebox.YES | Messagebox.NO, Messagebox.QUESTION)== Messagebox.YES){	
//			   if (FDialog.ask (WindowNo, null, "¿Desea que el sistema busque posibles Tercero?") ){
			     		rifAux=  rif.substring(1,rif.length());
					    if (rifAux.length()==7){
						 	rifAux= "0"+rifAux;
						}
					    rifAux= "0"+rifAux;
					    br =this.existe(url+rifAux);
					    if (br== null){
					    	rifAux=rif.substring(0, 1)+rifAux.substring(1, rifAux.length());
					    	Integer i=0;
					    	while (br==null && i<10){
					    		 rifAux=rifAux.substring(0, 9) +i;
					    		 br =this.existe(url+rifAux);
								 i++;  
					    	}
					    }
					    if (br==null) return "RIF NO EXISTE";
								
			  
			}

			String entrada;
			String cadena="";

			while ((entrada = br.readLine()) != null){
				cadena = cadena + entrada;
			}
			

			DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
			DocumentBuilder db = dbf.newDocumentBuilder();

			InputSource archivo = new InputSource();
			archivo.setCharacterStream(new StringReader(cadena)); 

			Document documento = db.parse(archivo);
			documento.getDocumentElement().normalize();

			NodeList nodeLista = documento.getElementsByTagName("rif:Rif");

			
				for (int s = 0; s < nodeLista.getLength(); s++) {
			
					Node primerNodo = nodeLista.item(s);
					String nombre;
					String agenteRet;
					String contrib;
			
					if (primerNodo.getNodeType() == Node.ELEMENT_NODE) {
			
						Element primerElemento = (Element) primerNodo;
				
						NodeList primerNombreElementoLista =
					                        primerElemento.getElementsByTagName("rif:Nombre");
						Element primerNombreElemento =
					                        (Element) primerNombreElementoLista.item(0);
						NodeList primerNombre = primerNombreElemento.getChildNodes();
						nombre = ((Node) primerNombre.item(0)).getNodeValue().toString();
						
						
						
						NodeList segundoNombreElementoLista =
	                        primerElemento.getElementsByTagName("rif:AgenteRetencionIVA");
						Element segundoNombreElemento =
					                        (Element) segundoNombreElementoLista.item(0);
						NodeList segundo = segundoNombreElemento.getChildNodes();
						agenteRet = ((Node)segundo.item(0)).getNodeValue().toString();
						
						
						NodeList tercerElementoLista =
				            primerElemento.getElementsByTagName("rif:ContribuyenteIVA");
						Element tercerElemento =
						            (Element) tercerElementoLista.item(0);
						NodeList tercerNombre = tercerElemento.getChildNodes();
						contrib = ((Node) tercerNombre.item(0)).getNodeValue().toString();
						 mTab.setValue("LVE_descriptionSeniat",	"Los datos del Asociados son: RIF: "+
							rifAux.substring(0, 1)+"-"+rifAux.substring(1, 9)+"-"+rifAux.substring(9, 10)+
							" \nNombre: '"+nombre +"' \nAgente de RetenciÃ³n: '"+agenteRet
							+"' \nContribuyente de IVA: '"+ contrib );
						
							if (cantidadOcurrencia(nombre, "(")>=2)														
							 nombre = nombre.substring(0, nombre.indexOf(")")+1);
							else if (cantidadOcurrencia(nombre, "(")==1)	
								 nombre = nombre.substring(0, nombre.indexOf("("));
							 mTab.setValue("LVE_nameSeniat",nombre );
							 mTab.setValue("LVE_rifSeniat",rifAux.substring(0, 1).toUpperCase()+"-"+rifAux.substring(1, 9)+"-"+rifAux.substring(9, 10) );
							 mTab.setValue("LVE_IsValidationSeniat","Y");
							 
							
							return "Verificar si desea reemplazar";
								
						}
						
			
					
				}
			} catch (Exception e) {
			    e.printStackTrace();
			 }
		return "RIF NO EXISTE";

	
	}
	
	public String validationYes (Properties ctx, int WindowNo, GridTab mTab, GridField mField, Object value) throws InterruptedException
	{
		if (isCalloutActive())
			return "";
		
		mTab.setValue("Rif",mTab.getValue("LVE_rifSeniat") );
	    mTab.setValue("Name",mTab.getValue("LVE_nameSeniat") );
	    mTab.setValue("LVE_IsValidationSeniat","N");
	    return "Finalizado";

	
	}
	
	public String validationNo (Properties ctx, int WindowNo, GridTab mTab, GridField mField, Object value) throws InterruptedException
	{
		if (isCalloutActive())
			return "";
		
		
	    mTab.setValue("LVE_IsValidationSeniat","N");
	    return "Finalizado";

	
	}
  public Integer cantidadOcurrencia (String sTexto, String sTextoBuscado ){
	  int contador=0;
	  while (sTexto.indexOf("(") > -1) {
	      sTexto = sTexto.substring(sTexto.indexOf(
	        sTextoBuscado)+sTextoBuscado.length(),sTexto.length());
	      contador++;
	      
	  }
	  return contador;
  }
	
  public BufferedReader existe(String url){
		try{
			BufferedReader buffer;
			URL urlA=
		    new URL(url);
			buffer=  new BufferedReader(new InputStreamReader(urlA.openStream()));
			return buffer;
		}
	catch (Exception e) {
		e.printStackTrace();
		return null;
	}
		
	}

  public String getUrlSeniat() {
		String urlSeniat = MSysConfig.getValue("URL_SENIAT",
				"", // default
				Env.getAD_Client_ID(Env.getCtx()));
		return urlSeniat;
  }
}

