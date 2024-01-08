package siu;


import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.NoSuchFileException;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;

public class gamesaver {
	public int rankToNumber(String rank)
	{
		if(rank.equals("Unranked"))
		{
			return 0;
		}
		else if(rank.equals("SilverI"))
		{
			return 1;
		}
		else if(rank.equals("SilverII"))
		{
			return 2;
		}
		else if(rank.equals("SilverIII"))
		{
			return 3;
		}
		else if(rank.equals("SilverIV"))
		{
			return 4;
		}
		else if(rank.equals("SilverElite"))
		{
			return 5;
		}
		else if(rank.equals("SilverEliteMaster"))
		{
			return 6;
		}
		else if(rank.equals("GoldNovaI"))
		{
			return 7;
		}
		else if(rank.equals("GoldNovaII"))
		{
			return 8;
		}
		else if(rank.equals("GoldNovaIII"))
		{
			return 9;
		}
		else if(rank.equals("GoldNovaMaster"))
		{
			return 10;
		}
		else if(rank.equals("MasterGuardianI"))
		{
			return 11;
		}
		else if(rank.equals("MasterGuardianII"))
		{
			return 12;
		}
		else if(rank.equals("MasterGuardianElite"))
		{
			return 13;
		}
		else if(rank.equals("DistinguishedMasterGuardian"))
		{
			return 14;
		}
		else if(rank.equals("LegendaryEagle"))
		{
			return 15;
		}
		else if(rank.equals("LegendaryEagleMaster"))
		{
			return 16;
		}
		else if(rank.equals("SupremeMasterFirstClass"))
		{
			return 17;
		}
		else if(rank.equals("GlobalElite"))
		{
			return 18;
		}
		else
		{
			return -1;
		}
	}
	
	public static void main(String[] args)
	{
		gamesaver scraper = new gamesaver();
		try {
			scraper.run();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void run() throws IOException
	{
		String playerdatasource = "Parol";
		FileWriter myWriter = new FileWriter(playerdatasource + "CsgoMatchData.csv");
	    myWriter.write("PlayerSource,Map,Server,AvgrankName,Avgranknum,Starttime,Team1Score,Team2Score,");
	    for(int i = 0; i < 10; i++)
	    {
	    	String number = "";
	    	String letter = "";
	    	if(i < 5)
	    	{
	    		number = "1";
	    	}
	    	else
	    	{
	    		number = "2";
	    	}
	    	
	    	if(i % 5 == 0)
	    	{
	    		letter = "A";
	    	}
	    	else if(i % 5 == 1)
	    	{
	    		letter = "B";
	    	}
	    	else if(i % 5 == 2)
	    	{
	    		letter = "C";
	    	}
	    	else if(i % 5 == 3)
	    	{
	    		letter = "D";
	    	}
	    	else if(i % 5 == 4)
	    	{
	    		letter = "E";
	    	}
	    	String str = "Player" + number + letter;
	    	if(i != 9)
	    	{
	    		myWriter.write(str + "stack," + str + "name," + str + "cheater," + str + "rankname," + str + "ranknum," + str + "kills," + str + "deaths," + str + "assists,"
		    			+ str + "plusminus," + str + "adr," + str + "hs," + str + "kast," + str + "rating," + str + "ef," + str + "fa," + str + "ft,"  + str + "utility,"
		    			+ str + "fkd," + str + "trade," + str + "clutch," + str + "multi,");
	    	}
	    	else
	    	{
	    		myWriter.write(str + "stack," + str + "name," + str + "cheater," + str + "rankname," + str + "ranknum," + str + "kills," + str + "deaths," + str + "assists,"
		    			+ str + "plusminus," + str + "adr," + str + "hs," + str + "kast," + str + "rating," + str + "ef," + str + "fa," + str + "ft,"  + str + "utility,"
		    			+ str + "fkd," + str + "trade," + str + "clutch," + str + "multi");
	    	}
	    	
	    	
	    	
	    }
	    myWriter.write("\n");
		
		
		
		
		
		
		
		int filecount = 300;
		int counter = 1;
		for(int i = 1; i<= 300; i++)
		{
			try
			{
				if(counter == 250)
				{
					break;
				}
				
				
				File file = new File("C:\\Users\\peter\\Desktop\\GameStats\\" + Integer.toString(i) + ".html");
				 String currentfile = FileUtils.readFileToString(file, StandardCharsets.UTF_8);
				    //System.out.print(currentfile);
				    
				    getinfo(playerdatasource,currentfile,myWriter);
				    counter++;
				   // break;
			}
			catch(NoSuchFileException e)
			{
				continue;
			}
			
		   
		}
		
	}

	private void getinfo(String sourcename,String cf, FileWriter wr) throws IOException {
		
		
		
		
		
		
		int startIndex = cf.indexOf("https://static.csstats.gg/images/maps/icons/", 0);
		int mapend = cf.indexOf(".png", startIndex);
		String map = cf.substring(startIndex+44, mapend);
		
		int underscore = map.indexOf("_", 0);
		map = map.substring(underscore + 1);
		if(map.contains("_"))
		{
			int secondUnder = map.indexOf("_");
			map = map.substring(0,secondUnder);
		}
		System.out.println(map);
		//WE HAVE MAP
		
		int serv1 = cf.indexOf("</span>", mapend);
		int serv2 = cf.indexOf("<span>", serv1);
		int serv3 = cf.indexOf("</span>", serv2);
		String server = cf.substring(serv2+6,serv3);
		System.out.println(server);
		//WE HAVE SERVER
		
		int rank1 = cf.indexOf("title=", serv3);
		int rank2 = cf.indexOf("style", rank1);
		String rank = cf.substring(rank1+7,rank2);
		rank = rank.replaceAll("\\s", "");
		rank = rank.substring(0, rank.length() - 1);
		System.out.println(rank);
		int avgranknum = rankToNumber(rank);
		//WE HAVE RANK
		
		int time1 = cf.indexOf("</span>", rank2);
		int time2 = cf.indexOf("<span>", time1);
		int time3 = cf.indexOf("</span>", time2);
		String time = cf.substring(time2+6,time3);
		System.out.println(time);
		//WE HAVE TIME
		
		int rounds1 = cf.indexOf("team-score-number", time3);
		int rounds2 = cf.indexOf(">", rounds1);
		int rounds3 = cf.indexOf("<", rounds2);
		String team1rounds = cf.substring(rounds2+1,rounds3);
		
		int rounds4 = cf.indexOf("team-score-number", rounds3);
		int rounds5 = cf.indexOf(">", rounds4);
		int rounds6 = cf.indexOf("<", rounds5);
		String team2rounds = cf.substring(rounds5+1,rounds6);
		
		System.out.println(team1rounds);
		System.out.println(team2rounds);
		//WE HAVE GAME SCORE
		
		wr.write(sourcename + "," + map +"," + server + "," + rank + "," + avgranknum + "," + time + "," + team1rounds + "," + team2rounds + ",");
		
		boolean utility = cf.contains("Utility");
		
		//Startin player stats
		int endIndex = rounds6;
		int loopcounter = 0;
		while(cf.contains("padding:3px; text-align: center;"))
		{
			//System.out.print("sus");
			//cf = cf.substring(endIndex);
			int sIndex = cf.indexOf("padding:3px; text-align: center;"); 
			int stackEnd = cf.indexOf("</span>", sIndex); 
			//System.out.print(sIndex + " " + stackEnd);
			String stackstring = cf.substring(sIndex,stackEnd);
			//System.out.print("sus");
			int stack = 0;
			
			if(stackstring.contains("src"))
			{
				if(stackstring.contains("two"))
				{
					stack = 2;
				}
				else if(stackstring.contains("three"))
				{
					stack = 3;
				}
				else if(stackstring.contains("four"))
				{
					stack = 4;
				}
				else if(stackstring.contains("five"))
				{
					stack = 5;
				}
			}
			System.out.print(stack + " ");
			//WE HAVE STACK
			

			int name1 = cf.indexOf("overflow:hidden; padding-right:16px;", stackEnd); 
			int name2 = cf.indexOf("</span>", name1); 
			String name = cf.substring(name1+38,name2);
			name = name.replace(",", "");
			System.out.print(name + " ");
			//WE HAVE NAME
			
			String hackString = cf.substring(stackEnd, name1);
			String hacker = "No";
			if(hackString.contains("banned"))
			{
				hacker = "Yes";
			}
			System.out.print(hacker + " ");
			
			//WE HAVE HACKING
			
			int ra1 = cf.indexOf("</td>", name2); 
			int ra2 = cf.indexOf("</td>", ra1 + 1); 
			String rankHtml = cf.substring(ra1, ra2);
			String rankString = "Unranked";
			if(rankHtml.contains("src"))
			{
				int tempra1 = rankHtml.indexOf("ranks/");
				int tempra2 = rankHtml.indexOf(".png");
				int ranknumber = Integer.parseInt(rankHtml.substring(tempra1+6,tempra2));
				if(ranknumber == 1)
				{
					rankString = "SilverI";
				}
				else if(ranknumber == 2)
				{
					rankString = "SilverII";
				}
				else if(ranknumber == 3)
				{
					rankString = "SilverIII";
				}
				else if(ranknumber == 4)
				{
					rankString = "SilverIIII";
				}
				else if(ranknumber == 5)
				{
					rankString = "SilverElite";
				}
				else if(ranknumber == 6)
				{
					rankString = "SilverEliteMaster";
				}
				else if(ranknumber == 7)
				{
					rankString = "GoldNovaI";
				}
				else if(ranknumber == 8)
				{
					rankString = "GoldNovaII";
				}
				else if(ranknumber == 9)
				{
					rankString = "GoldNovaIII";
				}
				else if(ranknumber == 10)
				{
					rankString = "GoldNovaMaster";
				}
				else if(ranknumber == 11)
				{
					rankString = "MasterGuardianI";
				}
				else if(ranknumber == 12)
				{
					rankString = "MasterGuardianII";
				}
				else if(ranknumber == 13)
				{
					rankString = "MasterGuardianElite";
				}
				else if(ranknumber == 14)
				{
					rankString = "DistinguishedMasterGuardian";
				}
				else if(ranknumber == 15)
				{
					rankString = "LegendaryEagle";
				}
				else if(ranknumber == 16)
				{
					rankString = "LegendaryEagleMaster";
				}
				else if(ranknumber == 17)
				{
					rankString = "SupremeMasterFirstClass";
				}
				else if(ranknumber == 18)
				{
					rankString = "GlobalElite";
				}
				else
				{
					rankString = "NA";
				}
			}
			
			System.out.print(rankString + " ");
			int ranknum = rankToNumber(rankString);
			//WE HAVE RANKS
			
			int k1 = cf.indexOf("center\">", ra2); 
			int k2 = cf.indexOf("center\">", k1 + 1); 
			int k3 = cf.indexOf("<", k2 + 1); 
			int kills = Integer.parseInt(cf.substring(k2+8,k3));
			System.out.print(kills + " ");
			//WE HAVE KILLS
			
			int d1 = cf.indexOf("center\">", k3); 
			int d2 = cf.indexOf("<", d1 + 1); 
			int deaths = Integer.parseInt(cf.substring(d1+8,d2));
			System.out.print(deaths + " ");
			//WE HAVE DEATHS
			
			int a1 = cf.indexOf("center\">", d2); 
			int a2 = cf.indexOf("<", a1 + 1); 
			int assists = Integer.parseInt(cf.substring(a1+8,a2));
			System.out.print(assists + " ");
			//WE HAVE ASSISTS
			
			int p1 = cf.indexOf("center\">", a2); 
			int p2 = cf.indexOf("<", p1 + 1); 
			double plusminus = 0.0;
			if(cf.substring(p1+8,p2) != null)
			{
				if(!cf.substring(p1+8,p2).trim().isEmpty())
				{
					plusminus = Double.parseDouble(cf.substring(p1+8,p2));
				}
				
			}
			
			System.out.print(plusminus + " ");
			//WE HAVE PLUSMINUS
			
			int ad05 = cf.indexOf("center", p2); 
			int ad1 = cf.indexOf(">", ad05); 
			int ad2 = cf.indexOf("<", ad1 + 1); 
			double adr = Double.parseDouble(cf.substring(ad1+1,ad2));
			System.out.print(adr + " ");
			//WE HAVE ADR
			
			int hs1 = cf.indexOf("center\">", ad2); 
			int hs2 = cf.indexOf("%<", hs1 + 1); 
			int hs = Integer.parseInt(cf.substring(hs1+8,hs2));
			System.out.print(hs + " ");
			//WE HAVE HS
			
			int ka1 = cf.indexOf("center\">", hs2); 
			int ka2 = cf.indexOf("%<", ka1 + 1); 
			double kast = Double.parseDouble(cf.substring(ka1+8,ka2));
			System.out.print(kast + " ");
			//WE HAVE KAST
			
			int rt05 = cf.indexOf("center\">", ka2+1);
			//int rt075 = cf.indexOf(">", rt05+1); 
			int rt1 = cf.indexOf(">", rt05+10);
			int rt2 = cf.indexOf("<", rt1); 
			double rating = Double.parseDouble(cf.substring(rt1+1,rt2));
			System.out.print(rating + " ");
			//WE HAVE RATING
			
			int lasti = rt2;
			String ef = "NA";
			String fa = "NA";
			String ebt = "NA";
			String util = "NA";
			if(utility)
			{
				int ef1 = cf.indexOf("split\">", rt2+1);
				int ef2 = cf.indexOf("<", ef1); 
				ef = cf.substring(ef1+7,ef2);
				System.out.print(ef + " ");
				//WE HAVE FLASHES
				
				int fa05 = cf.indexOf(">", ef2+1);
				int fa1 = cf.indexOf(">", fa05+1);
				int fa2 = cf.indexOf("<", fa1); 
				fa = cf.substring(fa1+1,fa2);
				System.out.print(fa + " ");
				//WE HAVE FLASH ASSIST
				
				int ebt05 = cf.indexOf(">", fa2+1);
				int ebt1 = cf.indexOf(">", ebt05+1);
				int ebt2 = cf.indexOf("s<", ebt1); 
				ebt = cf.substring(ebt1+1,ebt2);
				System.out.print(ebt + " ");
				//WE HAVE FLASH TIME
				
				int ut05 = cf.indexOf(">", ebt2+1);
				int ut1 = cf.indexOf(">", ut05+1);
				int ut2 = cf.indexOf("<", ut1); 
				util = cf.substring(ut1+1,ut2);
				System.out.print(util + " ");
				//WE HAVE UTIL
				
				lasti = ut2;
			}
			int fkd05 = cf.indexOf("fk", lasti+1);
			int fkd1 = cf.indexOf(">", fkd05+1);
			int fkd2 = cf.indexOf("<", fkd1); 
			int fkd = Integer.parseInt(cf.substring(fkd1+1,fkd2));
			System.out.print(fkd + " ");
			//WE HAVE FKD
			
			int tr05 = cf.indexOf("trade", fkd2+1);
			int tr1 = cf.indexOf(">", tr05+1);
			int tr2 = cf.indexOf("<", tr1); 
			int trade = Integer.parseInt(cf.substring(tr1+1,tr2));
			System.out.print(trade + " ");
			//WE HAVE TRADE
			
			int cl05 = cf.indexOf("1vX", tr2+1);
			int cl1 = cf.indexOf(">", cl05+1);
			int cl2 = cf.indexOf("<", cl1); 
			int clutch = Integer.parseInt(cf.substring(cl1+1,cl2));
			System.out.print(clutch + " ");
			//WE HAVE CLUTCH
			
			int mu05 = cf.indexOf("multikill", cl2+1);
			int mu1 = cf.indexOf(">", mu05+1);
			int mu2 = cf.indexOf("<", mu1); 
			int multi = Integer.parseInt(cf.substring(mu1+1,mu2));
			System.out.print(multi + ", ");
			//WE HAVE MULTI
			
			if(loopcounter < 9)
			{
				wr.write(stack+ "," + name + "," + hacker + "," + rankString + "," + ranknum + "," + kills + "," + deaths + "," + assists + ","
						+ plusminus + "," + adr + "," + hs + "," + kast + "," + rating + "," + ef + "," + fa + "," + ebt + "," + util + ","
						+ fkd + "," + trade + "," + clutch + "," + multi + ",");	
			}
			else
			{
				wr.write(stack+ "," + name + "," + hacker + "," + rankString + "," + ranknum + "," + kills + "," + deaths + "," + assists + ","
						+ plusminus + "," + adr + "," + hs + "," + kast + "," + rating + "," + ef + "," + fa + "," + ebt + "," + util + ","
						+ fkd + "," + trade + "," + clutch + "," + multi + "\n");
			}
			
			
			endIndex = stackEnd;
			//update endIndex
			cf = cf.substring(endIndex);
			loopcounter++;
		}
		
		
		
	}

}
