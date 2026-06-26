# README updated to include fetch-gradle-wrapper usage

# com.mersal.app

هذا المستودع يحتوي على هيكل مشروع Android (Kotlin) بسيط لتبدأ التطوير.

كيفية التشغيل محليًا (محدّث)

1. تأكد من تثبيت Android Studio وAndroid SDK.
2. استنساخ المستودع:

   git clone https://github.com/bolbolasha345-sketch/com.mersal.app.git
   cd com.mersal.app

3. إذا كنت تريد تشغيل ./gradlew من الطرفية دون فتح Android Studio، قُم أولًا بإضافة gradle-wrapper.jar (موجود داخل gradle/wrapper). يمكنك إما فتح المشروع في Android Studio الذي سيُنشئ الملف تلقائياً، أو تشغيل السكربت التالي لتنزيله:

   Unix / macOS:
     ./fetch-gradle-wrapper.sh

   Windows (PowerShell):
     fetch-gradle-wrapper.bat

   السكربت سيقوم بتنزيل توزيعة Gradle المحددة (7.5.1) واستخراج gradle-wrapper.jar إلى gradle/wrapper/gradle-wrapper.jar

4. بعد وجود gradle-wrapper.jar يمكنك تشغيل:

   ./gradlew assembleDebug    # على Unix / macOS
   gradlew.bat assembleDebug  # على Windows

   أو افتح المشروع في Android Studio: File -> Open -> اختر مجلد المشروع.
5. تشغيل التطبيق على محاكي أو جهاز فعلي عبر Run -> Run 'app'.

ملاحظات
- أضفت سكربتات لتنزيل gradle-wrapper.jar (fetch-gradle-wrapper.sh و fetch-gradle-wrapper.bat). شغّلها محليًا إذا لم يظهر gradle-wrapper.jar.
- إذا تفضّل أن أرفع gradle-wrapper.jar مباشرة إلى المستودع بدلاً من السكربت، أخبرني وسأرفعه (ولكن حجم الملف الثنائي سيزيد حجم المستودع).
