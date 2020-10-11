#!/usr/bin/env lua

require 'busted.runner'()

describe("Task 1, Common Base String", function()
  local t1 = require'ch-1'
  it("produces correct results for the examples", function()
    assert.are.same(t1.common_base_string("abcdabcd", "abcdabcdabcdabcd"), {"abcdabcd", "abcd"})
    assert.are.same(t1.common_base_string("aaa", "aa"), {"a"})
  end)
end)

describe("Task 2, Frequency Sort", function()
  local t2  = require'ch-2'
  it("produces correct results for the examples", function()
    local expected = {
      [1]={"But", "City", "It", "Jet", "Juliet", "Latino", "New", "Romeo", "Side", "Story", "Their", "Then", "West", "York", "adaptation", "any", "anything", "at", "award-winning", "away", "become", "before", "begin", "best", "classic", "climactic", "coexist", "control", "dance", "do", "doesn't", "end", "ending", "escalates", "families", "feuding", "form", "former", "friend", "gains", "gangs", "goes", "happened", "hatred", "heartbreaking", "highway", "hoping", "in", "know", "love", "lovers", "meet", "meeting", "neither", "no", "one", "plan", "planning", "point", "romantic", "rumble", "run", "secret", "sends", "sister", "streets", "strikes", "terribly", "their", "two", "under", "understanding", "until", "violence", "warring", "what", "when", "where", "white", "whoever", "wins", "with", "wrong", "younger"},
      [2]={"Bernardo", "Jets", "Riff", "Sharks", "The", "by", "it", "led", "tragedy"},
      [3]={"Maria", "Tony", "a", "can", "of", "stop"},
      [4]={"to"},
      [9]={"and", "the"}
    }
    assert.are.same(t2.frequency_sort(t2.slurp("resources/input")), expected)
  end)
end)
