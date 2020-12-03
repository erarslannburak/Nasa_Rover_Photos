# Nasa_Rover_Photos

Projeyi klonladıktan sonra, proje dizininde 

```
pod install
```

ve

```
make carthage_bootstrap
```

komutlarını çalıştıp gerekli kütüphanelerin proye indirilmesini sağlayabilirsiniz. 

<br/>

**Not:** 
xCode 12 ve daha sonraki versiyonlarda simulator üzerinden test etmek için, Vendor dizini içerisinde

```
./carthage-build.sh build --platform iOS
```

komutunu çalıştırmanız gerekebilir.
