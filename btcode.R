# Load necessary package
install.packages("BradleyTerry2")  # Install if not already installed
library(BradleyTerry2)

# Load the CSV file (update path if needed)
data <- read.csv("hoopsno.csv")

# Ensure columns are correctly named (adjust if necessary)
colnames(data) <- c("winner", "loser", "win_count")  # Modify if your columns have different names

# Convert winner and loser columns to factors with the same levels
data$winner <- factor(data$winner, levels = teams)
data$loser  <- factor(data$loser, levels = teams)


# Fit the Bradley-Terry model
bt_model <- BTm(
  outcome = cbind(data$win_count, rep(0, nrow(data))),  # Wins vs. losses
  player1 = data$winner,   
  player2 = data$loser,   
  data = data
)

# Display model summary
summary(bt_model)

# Extract estimated team strengths
BTabilities(bt_model)
getwd()
