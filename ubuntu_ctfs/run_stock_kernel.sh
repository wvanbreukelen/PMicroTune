sudo /home/wiebe/Downloads/qemu-7.2.0/build/qemu-system-x86_64 \
	-cpu host\
	-enable-kvm \
	-smp cores=16 \
	-drive file=ubuntu.img.qcow2,format=qcow2 \
	-machine pc,nvdimm=on \
	-m 4G,slots=2,maxmem=32G \
    -object memory-backend-file,id=mem1,mem-path=nvdimm0,share=on,pmem=on,size=24G,align=2M \
	-device nvdimm,memdev=mem1,id=nv1,label-size=256K \
	-net user,host=10.0.2.10,hostfwd=tcp:127.0.0.1:2222-:22 \
	-net nic,model=e1000 \
    -vga virtio \
	-pidfile vm.pid
    # -cdrom "ubuntu-18.04.6-desktop-amd64.iso" \
	# -object memory-backend-file,id=mem2,share=on,mem-path=f27nvdimm1,size=4G,pmem=on \
	# -device nvdimm,memdev=mem2,id=nv2,label-size=2M \
	# -nographic \
	# -enable-kvm \
  	# -device nvdimm,memdev=mem1,id=nv1,label-size=2M \
	# -initrd ramdisk.img \

 