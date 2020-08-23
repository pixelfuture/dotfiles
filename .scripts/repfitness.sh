# !/bin/bash
REP1=https://www.repfitness.com/strength-equipment/strength-training/benches/rep-competition-bench-with-wide-pad
REP2=https://www.repfitness.com/strength-equipment/strength-training/benches/rep-fb-5000-competition-flat-bench
REP3=https://www.repfitness.com/strength-equipment/strength-training/benches/rep-fb-4000-comp-lite-bench
REP4=https://www.repfitness.com/strength-equipment/strength-training/benches/rep-flat-bench

# Use for testing only
TEST=https://www.repfitness.com/in-stock-items/rep-4-fold-fitness-mat

stockSearch() {
  # $1 means the first argument
  # grep Rod and echo file if successful
  RESULTS=$(curl -v --silent $1 --stderr - | grep "Out of stock")
  item=$2
  if [[ $RESULTS ]]; then
    echo "$item not in stock" >> ~/rep.log
    osascript -e 'display notification "Not in stock" with title "Still nothing"'
  else
    echo "$item in stock" >> ~/rep.log
    osascript -e 'display notification "Time to Buy '$item'" with title "Yeah!!"'
    say "TIME TO BUY!!!!! $2"
  fi
}

echo `date` >> ~/rep.log

stockSearch $REP1 "Competition Bench with Wide Pad"
stockSearch $REP2 "Competition Bench"
stockSearch $REP3 "Competition Lite Bench"
stockSearch $REP4 "Rep Flat Bench"
# stockSearch $TEST "TEST"
