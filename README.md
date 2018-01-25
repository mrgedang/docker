## Tekonologi Cloud Computing

**1. Konsep Cloud Computing**

Cloud computing adalah suatu model komputasi untuk memberikan kenyamanan dan on-demand akses jaringan 
untuk memanfaatkan secara bersama suatu sumber daya komputasi yang terkonfigurasi (misalnya jaringan, server, 
penyimpanan [Tradisional Harddisk, Network Storage SAN/NAS dll], aplikasi, dan layanan) dengan manajemen 
yang minimal dan  sumber dayanya bersifat abstrak (virtual) dan diberikan sebagai layanan di jaringan/internet 
melalui mekanisme tertentu.

![Piramida](https://i.imgur.com/UfhfaFQ.png)

Ada 3 jenis layanan yang bisa disediakan oleh cloud computing

- SaaS

Software as a service merupakan bentuk cloud computing yang berwujud aplikasi siap pakai, 
misalnya (email, facebook, twitter, dll).

- PaaS ---> _Docker_

Platform as a service merupakan bentuk cloud computing yang menyediakan layanan dalam bentuk 
platform atau lingkungan yang didesain untuk developer, misal (google appspot, firebase, dll). 
Pada kuliah ini, dilakukan pendalaman pembuatan cloud computing jenis ini dengan menggunakan docker.

- IaaS

Layanan yang diberikan oleh model layanan ini adalah hardware atau segala sesuatu yang bisa dipakai 
untuk membangun cloud computing tersebut (storage, network, server).


**2. Container (Docker)**

_Docker is "an open source project to pack, ship, and run any application as a lightweight container."_
	
![VM vs DOCKER](https://i.imgur.com/8Rnaskj.png)

Kebutuhan Container
- Kernel
- Libc
- Library

(_Catatan: Container yang dimaksud di sini merupakan container dari docker saja._)

**3. Membuat Image Docker**

- **github**

	- [alpine-dashing](https://github.com/mromadisiregar/docker/tree/master/alpine-dashing) - _Dashing pada alpine linux._
	- [centos-modsecurity](https://github.com/mromadisiregar/docker/tree/master/centos-modsecurity) - _Mencoba penggunaan entrypoint pada centos dengan apache + modsecurity._
	- [goproxy](https://github.com/mromadisiregar/docker/tree/master/goproxy) - _Simple proxy forwarder._
	- [nginx-test-config](https://github.com/mromadisiregar/docker/tree/master/nginx-test-config) - _Test konfigurasi nginx._
	- [php-limonade](https://github.com/mromadisiregar/docker/tree/master/php-limonade) - _Mencoba membangun REST dengan php-limonade._
	- [single-proc](https://github.com/mromadisiregar/docker/tree/master/single-proc) - _Percobaan membuat image terkecil._

- **dockerhub**

	- [alpine-dashing](https://hub.docker.com/r/mrsiregar/alpine-dashing/)
	- [centos-modsecurity](https://hub.docker.com/r/mrsiregar/centos-modsecurity/)
	- [goproxy](https://hub.docker.com/r/mrsiregar/goproxy/)
	- [nginx-test-config](https://hub.docker.com/r/mrsiregar/nginx-test-config/)
	- [php-limonade](https://hub.docker.com/r/mrsiregar/php-limonade/)
	- [single-proc](https://hub.docker.com/r/mrsiregar/single-proc/)
		


**4. Docker Compose**

Compose adalah alat yang digunakan untuk mendefinisikan dan menjalankan _"multiple docker container"_.

Membuat service dengan compose

- **github**

	- [flask-sqlite3](https://github.com/mromadisiregar/docker/tree/master/flask-sqlite3)
	- [wordpress-mariadb](https://github.com/mromadisiregar/docker/tree/master/wordpress-mariadb)
	- [compose-with-own-image](https://github.com/mromadisiregar/docker/tree/master/compose-with-own-image)
	- [godbapp](https://github.com/mromadisiregar/docker/tree/master/godbapp)


**5. Docker Swarm**

_Docker Swarm is a clustering and scheduling tool for Docker containers. 
With Swarm, IT administrators and developers can establish and manage a 
cluster of Docker nodes as a single virtual system._

Docker swarm merupakan mode dari docker yang khusus digunakan untuk membangun cluster
dari beberapa _docker container_. Di dalam cluster ini terdapat dua buah node yang bisa
dibentuk, yaitu _manager_ dan _worker_. Manager bertugas mengendalikan dari worker yang
ter-register di dalamnya. Worker bertugas membuat instance dari service yang dibuat 
melalui node master.


**6. Minikube**

Minikube adalah miniatur dari kubernetes. Dengan minikube dapat dijalankan _"single-node"_ cluster kubernetes
pada mesin virtual.

**7. Unikernel**

_Unikernels are specialised, single-address-space machine images constructed by using library operating systems._

![Unikernel](https://i.imgur.com/i0RcHcz.png)

Ketika sebuah servis didesain mengimplementasikan unikernel, maka hal yang didapatkan adalah _kecilnya kemungkinan
munculnya isu keamanan_ dan otomatis akan mempersulit pihak luar untuk mendapatkan informasi tentang servis
dan resource yang digunakan. Seperti terlihat pada gambar desain unikernel, aplikasi langsung dijalankan sebagai
service sekaligus _(pada umumnya servis dan aplikasi adalah dua hal yang berbeda)_. Atau dengan kata lain, unikernel
hanya berisi library yang dibutuhkan aplikasi saja.
