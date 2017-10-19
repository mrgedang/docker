## Alpine Dashing

This Dockerfile will build dashing image from alpine linux. For sample i create a simple dashboard (dockermentions.erb) with one widgets (twitter). 

---

**How to run this code?**
```
~ docker build mrsiregar/alpine-dashing
```

**Check the mentions**
```
~ docker run mrsiregar/alpine-dashing
```

Then open http://<container-ip-address>:3030/

