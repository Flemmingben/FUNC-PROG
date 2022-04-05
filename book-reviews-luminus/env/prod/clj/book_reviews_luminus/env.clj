(ns book-reviews-luminus.env
  (:require [clojure.tools.logging :as log]))

(def defaults
  {:init
   (fn []
     (log/info "\n-=[book-reviews-luminus started successfully]=-"))
   :stop
   (fn []
     (log/info "\n-=[book-reviews-luminus has shut down successfully]=-"))
   :middleware identity})
