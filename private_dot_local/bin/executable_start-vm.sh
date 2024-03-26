#!/bin/bash
virsh --connect qemu:///system start ah-virt
virt-manager --connect qemu:///system --show-domain-console  ah-virt
