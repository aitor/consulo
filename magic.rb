require 'rubygems'
require 'classifier'
require 'madeleine'



b = Classifier::Bayes.new 'hot', 'not'

b.train_hot "here are some good words. I hope you love them"
b.train_not "here are some bad words, I hate you"

puts b.classify("I hate bad words and you") 

m = SnapshotMadeleine.new("bayes_data") {
    Classifier::Bayes.new 'hot', 'not'
}
m.system.train_hot "here are some good words. I hope you love them"
m.system.train_not "here are some bad words, I hate you"
m.take_snapshot
puts m.system.classify("I love you")