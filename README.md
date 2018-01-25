## Tekonologi Cloud Computing

**1. Konsep Cloud Computing**

Cloud computing adalah suatu model komputasi untuk memberikan kenyamanan dan on-demand akses jaringan untuk memanfaatkan secara bersama suatu sumber daya komputasi yang terkonfigurasi (misalnya jaringan, server, penyimpanan [Tradisional Harddisk, Network Storage SAN/NAS dll], aplikasi, dan layanan) dengan manajemen yang minimal dan  sumber dayanya bersifat abstrak (virtual) dan diberikan sebagai layanan di jaringan/internet melalui mekanisme tertentu.

![Piramida](https://i.imgur.com/UfhfaFQ.png)

Ada 3 jenis layanan yang bisa disediakan oleh cloud computing :

	- ~~SaaS~~
	Software as a service merupakan bentuk cloud computing yang berwujud aplikasi siap pakai, misalnya (email, facebook, twitter, dll).

	- **__PaaS__** ---> __Docker__ 
	Platform as a service merupakan bentuk cloud computing yang menyediakan layanan dalam bentuk platform atau lingkungan yang didesain untuk developer, misal (google appspot, firebase, dll). Pada kuliah ini, dilakukan pendalaman pembuatan cloud computing jenis ini dengan menggunakan __docker__.

	- ~~IaaS~~
	Layanan yang diberikan oleh model layanan ini adalah hardware atau segala sesuatu yang bisa dipakai untuk membangun cloud computing tersebut (storage, network, server).


**2. Container (Docker)**
``
__Docker is "an open source project to pack, ship, and run any application as a lightweight container."__
``
	
![VM vs DOCKER](https://i.imgur.com/8Rnaskj.png)

	Kebutuhan Container
	- Kernel
	- Libc
	- Library


**3. Membuat Image Docker**

- **github**

	- [alpine-dashing](https://github.com/mromadisiregar/docker/tree/master/alpine-dashing) - __Dashing pada alpine linux.__ 
	- [centos-modsecurity](https://github.com/mromadisiregar/docker/tree/master/centos-modsecurity) - __Mencoba penggunaan entrypoint pada centos dengan apache + modsecurity.__
	- [goproxy](https://github.com/mromadisiregar/docker/tree/master/goproxy) - __Simple proxy forwarder.__
	- [nginx-test-config](https://github.com/mromadisiregar/docker/tree/master/nginx-test-config) - __Test konfigurasi nginx__
	- [php-limonade](https://github.com/mromadisiregar/docker/tree/master/php-limonade) - __Mencoba membangun REST dengan php-limonade.__
	- [single-proc](https://github.com/mromadisiregar/docker/tree/master/single-proc) - __Percobaan membuat image terkecil__

- **dockerhub**

	- [alpine-dashing](https://hub.docker.com/r/mrsiregar/alpine-dashing/)
	- [centos-modsecurity](https://hub.docker.com/r/mrsiregar/centos-modsecurity/)
	- [goproxy](https://hub.docker.com/r/mrsiregar/goproxy/)
	- [nginx-test-config](https://hub.docker.com/r/mrsiregar/nginx-test-config/)
	- [php-limonade](https://hub.docker.com/r/mrsiregar/php-limonade/)
	- [single-proc](https://hub.docker.com/r/mrsiregar/single-proc/)
		


**4. Docker Compose**

Compose adalah alat yang digunakan untuk mendefinisikan dan menjalankan __multiple docker container__.
	Membuat service dengan compose

	- **github**

		- 


**5. Docker Swarm**

		- Clustering

**6. Minikube**

**7. Unikernel**