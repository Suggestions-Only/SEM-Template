require(readr)
vid_games <- read_csv("~/School Work/Psychology Research/Video Game Research/Video Game Survey Data File 21 (SDT Total).csv")
nomissing <- na.omit(vid_games)
require(lavaan)
require(semPlot)
model = '
  Fighter ~ Achievement + Interaction + Immersion
  RPG ~ Achievement + Interaction + Immersion
  Action ~ Achievement + Interaction + Immersion
  Puzzle ~ Achievement + Interaction + Immersion
  S_Media ~ Achievement + Interaction + Immersion
  Platormer ~ Achievement + Interaction + Immersion
  Strategy ~ Achievement + Interaction + Immersion
  Sim ~ Achievement + Interaction + Immersion
  Shooter ~ Achievement + Interaction + Immersion
  MOBA ~ Achievement + Interaction + Immersion
  ActivityFlowState ~ Fighter + RPG + Action + Puzzle + S_Media + Platormer + Strategy + Sim + Shooter + MOBA'
results <- sem(model = model, data = nomissing)
semPaths(results, whatLabels = "std", layout = "tree2", rotation = 2)
standardizedSolution(results)