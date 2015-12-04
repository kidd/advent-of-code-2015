(ns four.core
  (:require [digest])
  (:gen-class))

(def key "bgvyzdsv")



(defn -main
  "I don't do a whole lot ... yet."
  [count]
  (require 'digest)
  (loop [k key n 0]
    (if (= (clojure.string/join (repeat count "0"))
           (subs (digest/md5 (str k n)) 0 count))
      (println n)
      (recur key (inc n)))))
