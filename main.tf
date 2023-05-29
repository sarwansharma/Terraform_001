provider "vsphere" {
  user                 = root
  password             = 'credentials("vsphere_password")'

  vsphere_server       = "vcsa.vsphere.local"
  allow_unverified_ssl = true
}

data "vsphere_datacenter" "datacenter" {
  name = "5. Automation Sandbox"
}

data "vsphere_datastore" "datastore" {
  name          = "ESXI702-DS"
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_compute_cluster" "cluster" {
  name          = "Automation-Sandbox"
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_network" "network" {
  name          = "VM Network"
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_virtual_machine" "template" {
  name          = "centos"
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

resource "vsphere_virtual_machine" "vm" {
  name             = "centos-vm-from-template"
  resource_pool_id = data.vsphere_compute_cluster.cluster.resource_pool_id
  datastore_id     = data.vsphere_datastore.datastore.id
  num_cpus         = 1
  memory           = 2048
  guest_id         = "centos7_64Guest"
  network_interface {
    network_id = data.vsphere_network.network.id
  }
  disk {
    label = "disk0"
    size  = 40
    thin_provisioned = true
  }
  clone {
    template_uuid = data.vsphere_virtual_machine.template.id
  }
}
