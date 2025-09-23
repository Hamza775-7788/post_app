// ignore_for_file: type_literal_in_constant_pattern

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:post_app/core/error/failure.dart';

String failureToMessage(Failure failure) {
  switch (failure.runtimeType) {
    case const (OfflineFailure):
      return "يبدو أنك غير متصل بالإنترنت.";
    case ServerFailure:
      return "حدث خطأ في الخادم. يرجى المحاولة لاحقًا.";
    case EmptyCashFailure:
      return "لا توجد بيانات في الذاكرة.";
    case PassowrdWrongFailuer: // ملاحظة: هناك خطأ في التهجئة
      return "كلمة المرور المدخلة غير صحيحة.";
    case OperationNotCompletedFailure:
      return "لم تكتمل العملية بنجاح.";
    case EmptyRemotDataFailure:
      return "لا توجد بيانات متاحة من المصدر البعيد.";
    case UnexpectedErrorFailuer: // ملاحظة: هناك خطأ في التهجئة
      return "حدث خطأ غير متوقع.";
    case DuplicateFailuer:
      return "يبدو أن البيانات المدخلة مكررة.";
    case PermissionFailuer:
      return "لا تمتلك الإذن للقيام بهذه العملية.";
    case LinkedRecourdFailuer: // ملاحظة: هناك خطأ في التهجئة
      return "هناك مشكلة في السجلات المرتبطة.";
    case BalanceNotEneghFailuer: // ملاحظة: هناك خطأ في التهجئة
      return "الرصيد غير كافٍ لإكمال العملية.";
    case NameNotEneghFailuer: // ملاحظة: هناك خطأ في التهجئة
      return "الاسم المدخل غير كاف.";
    case InvalidKeyFailuer:
      return "المفتاح المدخل غير صالح.";
    case InvalidAccountFailuer:
      return "الحساب المدخل غير صالح.";
    case AccountExistsFailuer:
      return "الحساب موجود بالفعل.";
    case FacilityExistsFailuer:
      return "المنشأة موجودة بالفعل.";
    case NameExistsFailuer:
      return "الاسم موجود بالفعل.";
    case PhoneAlredyExistsFailuer: // ملاحظة: هناك خطأ في التهجئة
      return "رقم الهاتف موجود بالفعل.";
    case UnAuthraiszdFailuer: // ملاحظة: هناك خطأ في التهجئة
      return "غير مصرح لك بالوصول.";
    case KeyInvalidFailuer:
      return "المفتاح المدخل غير صالح.";
    case InvalidCodeFailuer:
      return "الرمز المدخل غير صالح.";
    case InvalidEmailFailuer:
      return "البريد الإلكتروني المدخل غير صالح.";
    case LinkedEmailFailuer:
      return "البريد الإلكتروني مرتبط بالفعل.";
    case PausedFailuer:
      return "تم إيقاف العملية.";
    case CanceldFailuer _:
      return "تم إلغاء العملية.";
    default:
      return "حدث خطأ غير معروف.";
  }
}

handeErorr(Failure failure) {
  String message = failureToMessage(failure);

  ScaffoldMessenger.maybeOf(Get.context!)?.showSnackBar(
    SnackBar(
      showCloseIcon: true,
      backgroundColor: Colors.red,
      content: Text(message, style: TextStyle(color: Colors.white)),
    ),
  );
}

handelSuccess() {
  ScaffoldMessenger.maybeOf(Get.context!)?.showSnackBar(
    SnackBar(
      showCloseIcon: true,
      backgroundColor: Colors.green,
      content: Text("نجح", style: TextStyle(color: Colors.white)),
    ),
  );
}
