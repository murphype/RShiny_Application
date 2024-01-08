#Written By Peter Murphy
#install.packages("data.table", dependencies=TRUE)
#install.packages("shiny", dependencies=TRUE)
#install.packages("shinyWidgets")
library(lubridate)
library(shinyWidgets)
library(data.table)
library(dplyr)
library(tidyr)
library(ggplot2)
library(shiny)
library(stringr)

#Here is where we cleanup and merge all our datasets
data1 <- fread("C:\\Users\\peter\\OneDrive\\Desktop\\VladCsgoMatchData.csv", fill=TRUE,)
data2 <- fread("C:\\Users\\peter\\OneDrive\\Desktop\\ducksonquacckCsgoMatchData.csv",fill=TRUE,)
data3 <- fread("C:\\Users\\peter\\OneDrive\\Desktop\\coronaCsgoMatchData.csv",fill=TRUE,)
data4 <- fread("C:\\Users\\peter\\OneDrive\\Desktop\\MissionCsgoMatchData.csv",fill=TRUE,)
data5 <- fread("C:\\Users\\peter\\OneDrive\\Desktop\\much profile very nameCsgoMatchData.csv",fill=TRUE)
data6 <- fread("C:\\Users\\peter\\OneDrive\\Desktop\\Elvis TekCsgoMatchData.csv",fill=TRUE)
data7 <- fread("C:\\Users\\peter\\OneDrive\\Desktop\\zebCsgoMatchData.csv",fill=TRUE)
data8 <- fread("C:\\Users\\peter\\OneDrive\\Desktop\\ParolCsgoMatchData.csv",fill=TRUE)


cleandata <- function(csgorawdata)
{
  betterdata <- csgorawdata %>%
    filter(!is.na(Player1Aadr)) %>% filter(!is.na(Player1Cadr)) %>%
    filter(!is.na(Player1Eadr)) %>% filter(!is.na(Player1Afkd)) %>%
    filter(!is.na(Player1Cfkd)) %>% filter(!is.na(Player1Efkd)) %>%
    filter(!is.na(Player2Aadr)) %>% filter(!is.na(Player2Cadr)) %>%
    filter(!is.na(Player2Eadr)) %>% filter(!is.na(Player2Afkd)) %>%
    filter(!is.na(Player2Cfkd)) %>% filter(!is.na(Player2Efkd)) %>%
    filter(!is.na(Player1Butility)) %>% filter(!is.na(Player1Bef)) %>%
    filter(!is.na(Player1Dutility)) %>% filter(!is.na(Player1Def)) %>%
    filter(!is.na(Player2Butility)) %>% filter(!is.na(Player2Bef)) %>%
    filter(!is.na(Player2Dutility)) %>% filter(!is.na(Player2Def))
  betterdata$Avgranknum <- as.numeric(betterdata$Avgranknum)
  betterdata$Team1Score <- as.numeric(betterdata$Team1Score)
  betterdata$Team2Score <- as.numeric(betterdata$Team2Score)
  
  betterdata$Player1Autility <- as.numeric(betterdata$Player1Autility)
  betterdata$Player1Afkd <- as.numeric(betterdata$Player1Afkd)
  betterdata$Player1Atrade <- as.numeric(betterdata$Player1Atrade)
  betterdata$Player1Aranknum <- as.numeric(betterdata$Player1Aranknum)
  betterdata$Player1Butility <- as.numeric(betterdata$Player1Butility)
  betterdata$Player1Bfkd <- as.numeric(betterdata$Player1Bfkd)
  betterdata$Player1Btrade <- as.numeric(betterdata$Player1Btrade)
  betterdata$Player1Branknum <- as.numeric(betterdata$Player1Branknum)
  betterdata$Player1Cutility <- as.numeric(betterdata$Player1Cutility)
  betterdata$Player1Cfkd <- as.numeric(betterdata$Player1Cfkd)
  betterdata$Player1Ctrade <- as.numeric(betterdata$Player1Ctrade)
  betterdata$Player1Cranknum <- as.numeric(betterdata$Player1Cranknum)
  betterdata$Player1Dutility <- as.numeric(betterdata$Player1Dutility)
  betterdata$Player1Dfkd <- as.numeric(betterdata$Player1Dfkd)
  betterdata$Player1Dtrade <- as.numeric(betterdata$Player1Dtrade)
  betterdata$Player1Dranknum <- as.numeric(betterdata$Player1Dranknum)
  betterdata$Player1Eutility <- as.numeric(betterdata$Player1Eutility)
  betterdata$Player1Efkd <- as.numeric(betterdata$Player1Efkd)
  betterdata$Player1Etrade <- as.numeric(betterdata$Player1Etrade)
  betterdata$Player1Eranknum <- as.numeric(betterdata$Player1Eranknum)
  
  betterdata$Player2Autility <- as.numeric(betterdata$Player2Autility)
  betterdata$Player2Afkd <- as.numeric(betterdata$Player2Afkd)
  betterdata$Player2Atrade <- as.numeric(betterdata$Player2Atrade)
  betterdata$Player2Aranknum <- as.numeric(betterdata$Player2Aranknum)
  betterdata$Player2Butility <- as.numeric(betterdata$Player2Butility)
  betterdata$Player2Bfkd <- as.numeric(betterdata$Player2Bfkd)
  betterdata$Player2Btrade <- as.numeric(betterdata$Player2Btrade)
  betterdata$Player2Branknum <- as.numeric(betterdata$Player2Branknum)
  betterdata$Player2Cutility <- as.numeric(betterdata$Player2Cutility)
  betterdata$Player2Cfkd <- as.numeric(betterdata$Player2Cfkd)
  betterdata$Player2Ctrade <- as.numeric(betterdata$Player2Ctrade)
  betterdata$Player2Cranknum <- as.numeric(betterdata$Player2Cranknum)
  betterdata$Player2Dutility <- as.numeric(betterdata$Player2Dutility)
  betterdata$Player2Dfkd <- as.numeric(betterdata$Player2Dfkd)
  betterdata$Player2Dtrade <- as.numeric(betterdata$Player2Dtrade)
  betterdata$Player2Dranknum <- as.numeric(betterdata$Player2Dranknum)
  betterdata$Player2Eutility <- as.numeric(betterdata$Player2Eutility)
  betterdata$Player2Efkd <- as.numeric(betterdata$Player2Efkd)
  betterdata$Player2Etrade <- as.numeric(betterdata$Player2Etrade)
  betterdata$Player2Eranknum <- as.numeric(betterdata$Player2Eranknum)
  betterdata$Player2Estack <- as.numeric(betterdata$Player2Estack)
  betterdata$Player2Ekills <- as.numeric(betterdata$Player2Ekills)
  betterdata$Player2Eadr <- as.numeric(betterdata$Player2Eadr)
  betterdata$Player2Ehs <- as.numeric(betterdata$Player2Ehs)
  return(betterdata)
}

vladdata <- cleandata(data1)
ducksondata <- cleandata(data2)
coronadata <- cleandata(data3)
missiondata <- cleandata(data4)
profnamedata <- cleandata(data5)
elvisdata <- cleandata(data6)
zebdata <- cleandata(data7)
paroldata <- cleandata(data8)

teamdata <- merge(vladdata, ducksondata, all.x = TRUE, all.y = TRUE)
teamdata <- merge(teamdata, coronadata, all.x = TRUE, all.y = TRUE)
teamdata <- merge(teamdata, missiondata, all.x = TRUE, all.y = TRUE)
teamdata <- merge(teamdata, profnamedata, all.x = TRUE, all.y = TRUE)
teamdata <- merge(teamdata, elvisdata, all.x = TRUE, all.y = TRUE)
teamdata <- merge(teamdata, elvisdata, all.x = TRUE, all.y = TRUE)
teamdata <- merge(teamdata, paroldata, all.x = TRUE, all.y = TRUE)

#Here we add Team Data Stats
teamdata <- teamdata %>%
  mutate(Scorediff = Team1Score - Team2Score,
         Utilitydiff = (Player1Autility + Player1Butility + Player1Cutility + Player1Dutility + Player1Eutility) - (Player2Autility + Player2Butility + Player2Cutility + Player2Dutility + Player2Eutility),
         EFlashdiff = (Player1Aef + Player1Bef + Player1Cef + Player1Def + Player1Eef) - 
           (Player2Aef +  Player2Bef + Player2Cef + Player2Def + Player2Eef),
         AFlashdiff = (Player1Afa + Player1Bfa + Player1Cfa + Player1Dfa + Player1Efa) - 
           (Player2Afa + Player2Bfa + Player2Cfa + Player2Dfa + Player2Efa),
         AvgHeadShotdiff = (Player1Ahs + Player1Bhs + Player1Chs + Player1Dhs + Player1Ehs)/5 - (Player2Ahs + Player2Bhs + Player2Chs + Player2Dhs + Player2Ehs)/5,
         AvgTeamRankdiff = (Player1Aranknum + Player1Branknum + Player1Cranknum + Player1Dranknum + Player1Eranknum)/5 - 
           (Player2Aranknum + Player2Branknum + Player2Cranknum + Player2Dranknum + Player2Eranknum)/5,
         AvgTeam1PlusMinues = (Player1Aplusminus + Player1Bplusminus + Player1Cplusminus + Player1Dplusminus + Player1Eplusminus)/5,
         AvgADRdiff = (Player1Aadr+ Player1Badr + Player1Cadr + Player1Dadr + Player1Eadr)/5 -(Player2Aadr+ Player2Badr + Player2Cadr + Player2Dadr + Player2Eadr)/5,
         Clutchdiff = (Player1Aclutch+ Player1Bclutch + Player1Cclutch + Player1Dclutch + Player1Eclutch) -(Player2Aclutch + Player2Bclutch + Player2Cclutch + Player2Dclutch + Player2Eclutch),
         Multikilldiff = (Player1Amulti+ Player1Bmulti + Player1Cmulti + Player1Dmulti + Player1Emulti) -(Player2Amulti + Player2Bmulti + Player2Cmulti + Player2Dmulti + Player2Emulti),
         Assistdiff = (Player1Aassists + Player1Bassists + Player1Cassists + Player1Dassists + Player1Eassists) - 
           (Player2Aassists + Player2Bassists + Player2Cassists + Player2Dassists + Player2Eassists))

#Here we split up our data into individual stats using pivot_longer
playerdata <- teamdata

playerdata <- pivot_longer(playerdata, 
                           cols = c("Player1Aranknum", "Player1Branknum", "Player1Cranknum", "Player1Dranknum", "Player1Eranknum", "Player2Aranknum", "Player2Branknum", "Player2Cranknum", "Player2Dranknum", "Player2Eranknum"), 
                           names_to = "playerteam1", 
                           values_to = "rank")

playerdata$playerteam1 = str_sub(playerdata$playerteam1, end = 8)

playerdata <- pivot_longer(playerdata, 
                           cols = c("Player1Autility", "Player1Butility", "Player1Cutility", "Player1Dutility", "Player1Eutility", "Player2Autility", "Player2Butility", "Player2Cutility", "Player2Dutility", "Player2Eutility"), 
                           names_to = "playerteam2", 
                           values_to = "utility")
playerdata$playerteam2 = str_sub(playerdata$playerteam2, end = 8)
playerdata <- playerdata %>%
  filter(playerteam2 == playerteam1)

playerdata <- pivot_longer(playerdata, 
                           cols = c("Player1Akast", "Player1Bkast", "Player1Ckast", "Player1Dkast", "Player1Ekast", "Player2Akast", "Player2Bkast", "Player2Ckast", "Player2Dkast", "Player2Ekast"), 
                           names_to = "playerteam3", 
                           values_to = "kast")
playerdata$playerteam3 = str_sub(playerdata$playerteam3, end = 8)
playerdata <- playerdata %>%
  filter(playerteam1 == playerteam3)

playerdata <- pivot_longer(playerdata, 
                           cols = c("Player1Aclutch", "Player1Bclutch", "Player1Cclutch", "Player1Dclutch", "Player1Eclutch", "Player2Aclutch", "Player2Bclutch", "Player2Cclutch", "Player2Dclutch", "Player2Eclutch"), 
                           names_to = "playerteam4", 
                           values_to = "clutch")
playerdata$playerteam4 = str_sub(playerdata$playerteam4, end = 8)
playerdata <- playerdata %>%
  filter(playerteam1 == playerteam4)

playerdata <- pivot_longer(playerdata, 
                           cols = c("Player1Amulti", "Player1Bmulti", "Player1Cmulti", "Player1Dmulti", "Player1Emulti", "Player2Amulti", "Player2Bmulti", "Player2Cmulti", "Player2Dmulti", "Player2Emulti"), 
                           names_to = "playerteam5", 
                           values_to = "multi")
playerdata$playerteam5 = str_sub(playerdata$playerteam5, end = 8)
playerdata <- playerdata %>%
  filter(playerteam1 == playerteam5)

playerdata <- pivot_longer(playerdata, 
                           cols = c("Player1Atrade", "Player1Btrade", "Player1Ctrade", "Player1Dtrade", "Player1Etrade", "Player2Atrade", "Player2Btrade", "Player2Ctrade", "Player2Dtrade", "Player2Etrade"), 
                           names_to = "playerteam6", 
                           values_to = "trade")
playerdata$playerteam6 = str_sub(playerdata$playerteam6, end = 8)
playerdata <- playerdata %>%
  filter(playerteam1 == playerteam6)

playerdata <- pivot_longer(playerdata, 
                           cols = c("Player1Afkd", "Player1Bfkd", "Player1Cfkd", "Player1Dfkd", "Player1Efkd", "Player2Afkd", "Player2Bfkd", "Player2Cfkd", "Player2Dfkd", "Player2Efkd"), 
                           names_to = "playerteam7", 
                           values_to = "fkd")
playerdata$playerteam7 = str_sub(playerdata$playerteam7, end = 8)
playerdata <- playerdata %>%
  filter(playerteam1 == playerteam7)

playerdata <- pivot_longer(playerdata, 
                           cols = c("Player1Aef", "Player1Bef", "Player1Cef", "Player1Def", "Player1Eef", "Player2Aef", "Player2Bef", "Player2Cef", "Player2Def", "Player2Eef"), 
                           names_to = "playerteam8", 
                           values_to = "ef")
playerdata$playerteam8 = str_sub(playerdata$playerteam8, end = 8)
playerdata <- playerdata %>%
  filter(playerteam1 == playerteam8)

playerdata <- pivot_longer(playerdata, 
                           cols = c("Player1Acheater", "Player1Bcheater", "Player1Ccheater", "Player1Dcheater", "Player1Echeater", "Player2Acheater", "Player2Bcheater", "Player2Ccheater", "Player2Dcheater", "Player2Echeater"), 
                           names_to = "playerteam9", 
                           values_to = "cheater")
playerdata$playerteam9 = str_sub(playerdata$playerteam9, end = 8)
playerdata <- playerdata %>%
  filter(playerteam1 == playerteam9)

winlosstie <- function(difference)
{
  difference <- as.numeric(difference)
  if(difference > 0)
  {
    return("Win")
  }
  else if(difference < 0)
  {
    return("Loss")
  }
  else
  {
    return("Tie")
  }
}
playerdata <- playerdata %>%
  filter(!is.na(Scorediff))

outcomes <-  character(length = nrow(playerdata))
for (i in 1:nrow(playerdata)) {
  outcomes[i] <- winlosstie(playerdata$Scorediff[i])
}
playerdata$outcome <- outcomes

#Here we compute Individual player data
individualdata <- playerdata
individualdata <- pivot_longer(individualdata, 
                               cols = c("Player1Aname", "Player1Bname", "Player1Cname", "Player1Dname", "Player1Ename", "Player2Aname", "Player2Bname", "Player2Cname", "Player2Dname", "Player2Ename"), 
                               names_to = "playerteam10", 
                               values_to = "realname")
individualdata$playerteam8 = str_sub(individualdata$playerteam8, end = 8)
individualdata <- individualdata %>%
  filter(playerteam8 == "Player1A") %>%
  filter(rank != 0) %>%
  filter(rank != -1)


individualdata  <- individualdata  %>%
  filter(realname == "Vlad" | realname == "Mission" |
           realname == "ducksonquacck" | realname == "c0r0n@" |
           realname == "much profile very name" | realname == "gerardmedina" |
           realname == "i will bark at hu tao" | realname == "Parol"
  )

individualdata  <- individualdata %>%
  mutate(gametime = dmy_hms(Starttime))

individualdatacut = individualdata
#individualdatacut  <- individualdatacut[,c(2,3,5,120:150)]
#individualdatacut  <- individualdatacut[,c(1,2,3,15:34)]
#individualdatacut  <- individualdatacut[,c(1,2,3,6,8,10,12,14,16,18,20,21,23)]

#Here is our Rshiny Application Code
ui <- navbarPage(
  "Counter Strike Statistics Application",
  tabPanel(
    "Team Stats Compared to Game Score",
    
    sidebarLayout(
      sidebarPanel(
        prettyRadioButtons(
          inputId = "theme",
          label = "Theme: ",
          choiceValues = c("A", "D", "E", "H"),
          choiceNames = c("Magma", "Viridis", "Cividis", "Turbo")
        ),
        
        
        selectInput(
          inputId = "var",
          label = "Select X Axis:",
          choices = c(
            "Utility Difference" = "Utilitydiff",
            "Difference in Effective Flashbangs" = "EFlashdiff",
            "Difference in Assists from Flashbangs" = "AFlashdiff",
            "Average Headshot Percentage Difference" = "AvgHeadShotdiff",
            "Difference in Team Average Rank" = "AvgTeamRankdiff",
            "Difference in Total Assists" = "Assistdiff",
            "Team1 Average PlusMinus" = "AvgTeam1PlusMinues",
            "Average Player Damage Per Round Difference Between Teams" = "AvgADRdiff",
            "Difference in Clutches" = "Clutchdiff",
            "Difference in Multikills" = "Multikilldiff"
          )
        ),
        
        radioButtons(
          inputId = "facet",
          label = "Select Facet Column:",
          choiceNames = c("Map", "Server"),
          choiceValues = c("Map", "Server")
        ),
      ),
      
      mainPanel(plotOutput("myplotteam"))
    )
  ),
  tabPanel(
    "Individual Stats Compared to Rank",
    selectInput(
      inputId = "var2",
      label = "Select X Axis:",
      choices = c(
        "Utility Damage" = "utility",
        "Percentage of rounds with a Kill, Assist, Survived or Death Traded" = "kast",
        "Quantity of 1vX Clutches" = "clutch",
        "3x+ Kill Rounds" = "multi",
        "Total Teammate Deaths Traded" = "trade",
        "First Kill, First Death difference" = "fkd",
        "Total Effective Flashbangs" = "ef",
        "Was Banned For Cheating" = "cheater"
      )
    ),
    
    radioButtons(
      inputId = "facet2",
      label = "Select Facet Column:",
      choiceNames = c("Map", "Server"),
      choiceValues = c("Map", "Server")
    ),
    plotOutput(outputId = "myplotplayer")
    
    
  ),
  tabPanel(
    "Individual Stats Over Time",
    selectInput(
      inputId = "var3",
      label = "Select Y Axis:",
      choices = c(
        "Rank" = "rank",
        "Utility Damage" = "utility",
        "Percentage of rounds with a Kill, Assist, Survived or Death Traded" = "kast",
        "Quantity of 1vX Clutches" = "clutch",
        "3x+ Kill Rounds" = "multi",
        "Total Teammate Deaths Traded" = "trade",
        "First Kill, First Death difference" = "fkd",
        "Total Effective Flashbangs" = "ef",
        "Was Banned For Cheating" = "cheater"
      )
    ),
    radioButtons(
      inputId = "color3",
      label = "Select Color Variable:",
      choiceNames = c("Map", "Server", "Win/Loss Outcome"),
      choiceValues = c("Map", "Server", "outcome")
    ),
    plotOutput(outputId = "plotindiv")
  )
  #Couldn't get the subsetting dataset to quite work
  #,
  #tabPanel(
    #"Individual Player Dataset",
    #selectInput(
      #inputId = "playerSub",
      #label = "Choose player data you want to see:",
      #choices = unique(individualdatacut$realname),
     # multiple = TRUE
    #),
    #tableOutput(outputId = "playertable")
  #)
)
server <- function(input, output) {
  fe <- reactive(input$facet)
  output$myplotteam <- renderPlot({
    ggplot(teamdata,
           aes_string(input$var, "Scorediff", color = teamdata$Avgranknum)) + geom_point() +
      ggtitle("Difference In Rounds Won  vs. Influential Team Stats") +
      scale_color_continuous(type = "viridis", option = input$theme) +
      facet_wrap(as.formula(paste("~", fe()))) +
      labs(color = "Average Game Rank")
  })
  
  
  output$myplotplayer <- renderPlot({
    ggplot(playerdata,
           aes_string(input$var2, "rank", color = "outcome")) + geom_point(alpha = 0.75) +
      scale_color_discrete(type = "viridis") +
      ggtitle("Individual Rank vs. Influential Performance Variables") +
      theme_bw() +
      facet_wrap(as.formula(paste("~", input$facet2)))
  })
  
  output$plotindiv <- renderPlot({
    ggplot(individualdatacut,
           aes_string("gametime", input$var3, color = input$color3)) + geom_point() +
      ggtitle("Time  vs. Individual Stats") +
      labs(x = "Date") +
      facet_wrap(as.formula(paste("~", "realname")))
  })
  
  function(input, output) {
    playersubset <- reactive({
      sub <- subset(individualdatacut, realname %in% c(input$playerSub))
      return(sub)
    })
    
    #output$playertable <- renderTable({
      #playersubset()
    #})
  }
}
shinyApp(ui, server)

