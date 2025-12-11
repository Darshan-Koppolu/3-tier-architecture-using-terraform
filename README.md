# 3-tier-architecture-using-terraform
this is just a code to deploy 3 tire architecture using terraform. but, explicitly need to install servers. NSG rules are given based on servers i installed (nginx works on 80, tomcat works on 8080 and mysql works on 3306)



this is the infrastructure:


Resource Group (japan east)
│
├── VNet01 (japan east)
│     └── subnet-web
│             ├── NSG-web
│             ├── NIC-web  (japan east)
│             ├── Public IP (japan east)
│             └── VM Web (japan east) (linux machine : Standard_D2s_V3) 
|
|              ^
|              |
|            peering 
|              |
|              v
│
├── VNet02 (japan west)
│     └── subnet-app
│             ├── NSG-app
│             ├── NIC-app (japan west)
│             └── VM App (japan West) (linux machine : Standard_D2s_V3)
|
|              ^
|              |
|           peering
|              |
|              V
│
└── VNet03 (south india)
      └── subnet-db
              ├── NSG-db
              ├── NIC-db (south india)
              └── VM DB (south india)  (linux machine : Standard_D2s_V3)

