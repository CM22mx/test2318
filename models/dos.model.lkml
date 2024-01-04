connection: "thelook"


# include all the views

include: "/views/**/*.view"


#include all the dashboards

#include: "/Dashboards/**/*.dashboard.lookml"


explore: audit{

  group_label: "core"

}
