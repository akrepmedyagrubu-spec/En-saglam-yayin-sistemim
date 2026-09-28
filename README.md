# Elimdeki en sağlam sistem
Ffmpeg programı ile videoları sıralı şekilde yayına sokan sistem. Render gibi sitelerde kullanılması önerilir ancak kendi vps'niz varsa orada en iyi performansı elde edersiniz

# Yapmanız gerekenler
rj1.mp4
reklam.mp4
rj2.mp4
jenerik.mp4
akilli.mp4
kv(Sayı).mp4
Gibi bir sırası var sistemin
rj - reklam giriş ve çıkış jeneriğini temsil ediyor
Jenerik ise dizi,sinema gibi jenerikleri
Akilli ise akıllı işaretleri
kv ise asıl yayınlanacak programı

Kv sayı kadar repoya video atın sayının sırasına göre ilerleyecektir

Örneğin repomuza kv1 ve kv2 dosyalarını atalım, ilk kv1 sonra kv2 yayınlanır ve bu yayında ilk olarak rj,reklam gibi şeyler yayınlanır

Ayrıca, repoya yayin_logo.png ve reklam_logo.png dosyalarını atın
Reklam resmi sadece adı reklam.mp4 olan videolarda tam overlay olur
Diğer videolarda yayın resmi
*AYRICA* Lütfen logolarınızı arkaplanı şeffaf olacak ve ekranda hangi tarafda gözükeceği belli şekilde atın, çünkü bu sistemde biz gelen resmi ekrana tam atıyoruz, kenara köşeye değil. (kendinize bir screenbug hazırlayın yani)
# Kalite
Yayın 420p ve 20fps olarak çıkıyor
# Platform önerisi
En sağlamı kendi vps gibi sunucunuzdur ancak bunlar paralı. Bedava tek alternatif render gibi siteler maalesef. Render ise size bedava planda 512mb ram ve 0.1 cpulu bir makine veriyor ve 
15 dk sonra sistem kapanıyor kimse girmezse. Bundan dolayı bir tane ping atan siteye bağlamanız lazım bu işi
# Render'da yapılacaklar
1- New web service yapın
2- Docker seçili kalsın ve free planı seçin
3- Deploy edin
Repoyu her güncellediğinizde yeniden deploy edin
Link her zaman sabit kalır, sadece siz her yeniden deploy ettiğinizde sistem en baştan başlar.

İyi kullanımlar



akdeniztelekomu

