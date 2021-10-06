(ns tw.weekly.c133.t1
  (:require  [clojure.edn :as edn]))

;;;
; Task description for TASK #1 › Integer Square Root
;;;
(def DEFAULT-INPUT [10])

(defn -main
  "Run Task 1 with a given input N, defaulting to the first example from the
  task description."
  [& args]
  (let [[N] (or (some->> args (map edn/read-string)) DEFAULT-INPUT)]
    ))
