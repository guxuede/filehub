package com.guxuede.gdxFramework.util.support;

import java.io.IOException;
import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.text.ParseException;

import com.fasterxml.jackson.annotation.JsonInclude.Include;
import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.databind.DeserializationContext;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.SerializationFeature;
import com.fasterxml.jackson.databind.SerializerProvider;
import com.fasterxml.jackson.databind.deser.std.StdScalarDeserializer;
import com.fasterxml.jackson.databind.ser.std.NumberSerializers;
import com.fasterxml.jackson.databind.ser.std.StdScalarSerializer;
import com.guxuede.gdxFramework.dto.PersonDTO;

public class ObjectMapper extends com.fasterxml.jackson.databind.ObjectMapper{

	/**
	 * 
	 */
	private static final long serialVersionUID = -4025005478032719378L;
	
	
	public ObjectMapper() {
		super();
		this.disable(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES);
		this.configure(SerializationFeature.FAIL_ON_EMPTY_BEANS,false);
		this.configure(DeserializationFeature.UNWRAP_ROOT_VALUE, true);
		this.configure(SerializationFeature.WRAP_ROOT_VALUE, true);
		this.setSerializationInclusion(Include.NON_NULL);
		
		//this.registerModule(arg0);

	}
	
	
	public static final class FloatDeserializer extends StdScalarDeserializer<Float> {
		private static final long serialVersionUID = 1L;
		
		public FloatDeserializer() {
			this(Float.class);
		}

		protected FloatDeserializer(Class<Float> arg0) {
			super(arg0);
		}
		
		@Override
		public Float deserialize(JsonParser arg0, DeserializationContext arg1)throws IOException{
	        DecimalFormatSymbols dfs = new DecimalFormatSymbols();  
	        dfs.setDecimalSeparator('.');  
	        dfs.setGroupingSeparator(',');  
	        dfs.setMonetaryDecimalSeparator('.'); 
	        DecimalFormat df = new DecimalFormat("###,###,###,###,###.##",dfs);  
	        //arg0.getCurrentLocation()
			try {
				return (Float) df.parse(arg0.getText());
			} catch (ParseException e) {
				e.printStackTrace();
				//throw new JsonParseException();
				//new com.fasterxml.jackson.databind.exc.InvalidFormatException();
			}
			return null;
		}
	}
	
	public static final class FloatSerializer extends StdScalarSerializer<Float>{

		public FloatSerializer() {
			this(Float.class);
		}
		
		protected FloatSerializer(Class<Float> arg0) {
			super(arg0);
		}
		@Override
		public void serialize(Float arg0, JsonGenerator arg1,SerializerProvider arg2) throws IOException,JsonGenerationException {
	        DecimalFormatSymbols dfs = new DecimalFormatSymbols();  
	        dfs.setDecimalSeparator('.');  
	        dfs.setGroupingSeparator(',');  
	        dfs.setMonetaryDecimalSeparator('.'); 
	        DecimalFormat df = new DecimalFormat("###,###,###,###,###.##",dfs);  
	        arg1.writeString(df.format(arg0));
		}
	}
	
	public final class MyNumberSerializer extends NumberSerializers{
		
	}
	
	public static void main(String[] args) throws JsonParseException, JsonMappingException, IOException {
	}
}
