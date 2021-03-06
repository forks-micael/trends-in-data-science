timeSeriesJob <- function(input, output, session, inputData){
  
  # Time Series Bar Plot
  output$plot <- renderPlot({
    ggplot(data = inputData, aes(x = month, y = N, group = job_type)) + geom_line(aes(colour = job_type)) + 
      scale_x_date(labels = scales::date_format("%Y-%m"), breaks = "1 month") +
      labs(y = "Job Count", x = "Month") +
      theme(axis.text.x = element_text(angle = 45, hjust = 1)) 
  })
  
}

