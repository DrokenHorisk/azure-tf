resource_group_name = "myResourceGroup"
location            = "westeurope"
vnet_name           = "myVnet"
address_space       = ["10.0.0.0/16"]
subnet_name         = "mySubnet"
subnet_prefixes     = ["10.0.1.0/24"]

vm_name             = "webserver"
vm_size             = "Standard_B1s"
admin_username      = "adminuser"
ssh_public_key      = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCwc91C+tKrhou8TDWwvItG6RLOoxD4+lkmbOOcKb7mAZs/6kBL8vW8rO3MfW26KASzTLFt+G3Hs9frWvX6Y11W8wHz362QdZDU9gO3fD8AAA/tHqMON+3nSDqa/hBUpdNmTqDBE6ETly89qjsJtd4Tn2kqVfv1V7ytZ8sm+puIQAECuiGREm6qZfFppWJ7DxvcMvOk9mp8oNbA/JLCFUF0urGuZrFaUT3uDztmleF+jdjSE2crsX6Bk6ADXe73yCkPRuM/+2Vlf6lCr9mVih2+KeLuF15OOyVLKdAwiHmwsdfzGnk24VKgcoWDFTnlW04vkg82p4bKMlMlNwdGDBZztxS/hxrQZd8Op6zq0/eyIe1oAVSYD9PfAO4F54byhz/RJ1bG8u8ZTI3sjCdaO97VYNWHFz4owYqsDxalVFTO16Rb/hGuVflA/vjfQZGKMNYV6hJ9ic087lbLMRp0QXhQH8TKAwHUvsUOHNKD0d3XL26KNeUXhCTsI98wFoa93/c= droken@DESKTOP-J421LAA"
network_interface_id = "NIC_ID_FROM_NETWORK_MODULE"


subscription_id = "0c7369f8-4025-4bac-9364-218d5e931143"
tenant_id       = "b7b023b8-7c32-4c02-92a6-c8cdaa1d189c"
