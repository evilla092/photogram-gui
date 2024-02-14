Rails.application.routes.draw do

  get("/", controller: "users", action: "list")

  get("/users", controller: "users", action: "list")

  post("/add_user", controller: "users", action: "create")

  get("users/:username", controller: "users", action: "profile")

  post("update_user/:user_id", controller: "users", action: "update")

  get("/photos", controller: "photos", action: "list")

  post("/insert_photo_record", controller: "photos", action: "create")

  get("/photos/:photo_id", controller: "photos", action: "details")

  post("/update_photo/:photo_id", controller: "photos", action: "update")

  post("/add_comment", controller: "comments", action: "create")

  get("/delete_photo/:photo_id", controller: "photos", action: "destroy")

end
