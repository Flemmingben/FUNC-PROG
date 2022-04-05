(ns book-reviews-luminus.routes.home
    (:require
        [book-reviews-luminus.layout :as layout]
        [book-reviews-luminus.db.core :as db]
        [clojure.java.io :as io]
        [book-reviews-luminus.middleware :as middleware]
        [ring.util.response]
        [ring.util.http-response :as response]
        [struct.core :as stc]
        [clojure.tools.logging :as log]))

(def review-schema
    {:book_id  [stc/required stc/number-str]
     :reviewer [stc/required stc/email]
     :review   [stc/required stc/string]})

(defn validate-review
    [params]
    (first (stc/validate params review-schema)))

(defn home-page [request]
    (layout/render
        request
        "home.html"
        {:docs (-> "docs/docs.md" io/resource slurp)}))

(defn about-page [request]
    (layout/render
        request
        "about.html"))

(defn save-review [{:keys [params]}]
    ;(log/debug (select-keys params [:reviewer]))
    ;(log/debug (db/get-user-by-email {:email (select-keys params [:reviewer])})))
    ;(log/debug (db/get-user-by-email {:email "j@j.j"})))
    ;(log/debug (params [:reviewer])))
    ;(log/debug (db/get-user-by-email {:email (select-keys params [:reviewer])})))
    ;(log/debug (:reviewer (select-keys params [:reviewer]))))
    ;(log/debug (db/get-user-by-email {:email (:reviewer (select-keys params [:reviewer]))})))


    (if-let [errors (validate-review params)]
        (-> (response/found "/reviews")
            (assoc :flash (assoc params :errors errors)))
        (if (not= [] (db/get-user-by-email {:email (:reviewer (select-keys params [:reviewer]))}))
            ;(db/create-review! params)))
            (do
                (db/create-review!
                    (merge {:published (.format (new java.text.SimpleDateFormat "yyyy-MM-dd") (java.util.Date.))}
                           params))
                (response/found "/reviews"))
            (-> (response/found "/reviews")
                (assoc :flash (assoc params :errors {:reviewer "Reviewer not found"}))))))

(defn reviews-page [{:keys [flash] :as request}]
    (layout/render
        request
        "reviews.html"
        ;(log/debug {:items (db/get-reviews-with-title)})
        (merge
            ;;{:items (db/get-reviews)}
            ;;(select-keys flash [:book_id :review :reviewer :errors]))))
            {:items (db/get-reviews-with-title)}
            (select-keys flash [:title :review :reviewer :errors]))))

(defn user-list[{:keys [flash] :as request}]
    (layout/render
        request
        "users.html"
        (merge
            {:items (db/get-users)}
            (select-keys flash [:first_name :last_name :email :pass :errors]))))

(def user-schema
    {:first_name  [stc/required stc/string]
     :last_name  [stc/string]
     :email [stc/required stc/email]
     :pass   [stc/required stc/string]})

(defn validate-user
    [params]
    (first (stc/validate params user-schema)))

(defn add-user [{:keys [params]}]
    (if-let [errors (validate-user params)]
        (-> (response/found "/users")
            (assoc :flash (assoc params :errors errors)))
        (do
            (db/create-user! params)
            (response/found "/users"))))

(defn home-routes []
    [ ""
     {:middleware [middleware/wrap-csrf
                   middleware/wrap-formats]}
     ["/" {:get home-page}]
     ["/about" {:get about-page}]
     ["/reviews" {:get reviews-page
                  :post save-review}]
     ["/users" {:get user-list
                :post add-user}]])
