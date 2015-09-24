
library(randomForest)
library(caret)

shinyServer(
  function(input, output) {
    
    rf <- readRDS("rf.rds") 
    
    
    values <- reactiveValues()
    values$df <- data.frame(Pclass=as.factor(1), Sex=as.factor("male"), SibSp=as.numeric(1), Parch=as.numeric(1))
    
    dataset <- observe({
      values$df$Pclass <- as.factor(input$Pclass)
      values$df$Sex <- as.factor(tolower(input$Sex))
      values$df$SibSp <- as.numeric(input$SibSp)
      values$df$Parch <- as.numeric(input$Parch)
    })
    
    output$inputValue <- renderPrint({print.data.frame(values$df, row.names=FALSE)})
    output$prediction <- renderPrint({
      pred <- predict(rf, values$df)
      s <- ""
      if (pred== 0) {
        s <- "Passenger was killed"
      }
      if (pred== 1) {
        s <- "Passenger survived"
      }
      print(s)
    })
  }
)