package com.sistautodb.dao;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

public class InputStream {
	public static void main(String[] args){
		BufferedReader br = null;
		
		FileReader fr = null;
		PokemonDAO dao = new PokemonDAO();
						// C:\Users\sist\git\pokemon\PoketProject\src\com\sistautodb\dao\db.txt
		try {			// C:\\Users\\sist\\git\\project_poket3\\PoketProject\\src\\com\\sistautodb\\dao\\db.txt
			String path = "C:\\Users\\sist\\git\\pokemon\\PoketProject\\src\\com\\sistautodb\\dao\\db.txt";
			System.out.println(System.getProperty("user.dir"));
			fr = new FileReader(path);
			br = new BufferedReader(fr);

			String sCurrentLine;

			br = new BufferedReader(new FileReader(path));
			int numOfLine = 0;
			
			while ((sCurrentLine = br.readLine()) != null) {
				//System.out.println(sCurrentLine);
				String[] temp = sCurrentLine.split("\t");
				for(int i = 0; i < temp.length; i++){
					if(temp[i].equals("0")){
						temp[i] = "0";
					}
				}
				System.out.println();
				PokemonVO vo = new PokemonVO();
				//no	name	rev1	rev2	rev3	type1	type2	s_type1	s_type2	l_type1	l_type2
				//no, name, rev1, rev2, rev3, type1, type2, s_type1, s_type2, l_type1, l_type2 
				vo.setNo(temp[0]);
				vo.setName(temp[1]);
				vo.setType1(temp[2]);
				vo.setType2(temp[3]);
				vo.setRev1(temp[4]);
				vo.setRev2(temp[5]);
				vo.setRev3(temp[6]);
				vo.setRev4(temp[7]);
				vo.setRev5(temp[8]);
				vo.setRev6(temp[9]);
				vo.setS_type1(temp[10]);
				vo.setS_type2(temp[11]);
				vo.setL_type1(temp[12]);
				vo.setL_type2(temp[13]);
				vo.setCp(temp[14]);
				vo.setAtt(temp[15]);
				vo.setDef(temp[16]);
				vo.setHp(temp[17]);
				vo.setGps1(temp[18]);
				vo.setGps2(temp[19]);
				
				/*System.out.println(
						 vo.getNo() + " " 
						+vo.getName() + " "
						+vo.getType1() + " "
						+vo.getType2() + " "
						+vo.getRev1() + " "
						+vo.getRev2() + " "
						+vo.getRev3() + " "
						+vo.getS_type1() + " "
						+vo.getS_type2() + " "
						+vo.getL_type1() + " "
						+vo.getL_type2() + " "
				);*/
				dao.update(vo);
				numOfLine++;
			}
			
			System.out.println("db °¹¼ö: " + (numOfLine) + "°³");

		} catch (IOException e) {

			e.printStackTrace();

		} finally {

			try {

				if (br != null)
					br.close();

				if (fr != null)
					fr.close();

			} catch (IOException ex) {
				System.out.println(ex.getMessage());
				ex.printStackTrace();
			}

		}
	}
}
