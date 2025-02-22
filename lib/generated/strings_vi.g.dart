///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

part of 'strings.g.dart';

// Path: <root>
typedef TranslationsVi = Translations; // ignore: unused_element
class Translations implements BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final i18n = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.vi,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <vi>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	// Translations
	String get Name => 'Bio Explore';
	late final TranslationsMainTabVi MainTab = TranslationsMainTabVi.internal(_root);
	late final TranslationsCommonActionVi CommonAction = TranslationsCommonActionVi.internal(_root);
	late final TranslationsCommonDataVi CommonData = TranslationsCommonDataVi.internal(_root);
	late final TranslationsCommonNotiActionVi CommonNotiAction = TranslationsCommonNotiActionVi.internal(_root);
	late final TranslationsCommonValidationVi CommonValidation = TranslationsCommonValidationVi.internal(_root);
	late final TranslationsPermissionVi Permission = TranslationsPermissionVi.internal(_root);
	late final TranslationsLostConnectionVi LostConnection = TranslationsLostConnectionVi.internal(_root);
	late final TranslationsPlaceholderVi Placeholder = TranslationsPlaceholderVi.internal(_root);
	late final TranslationsErrorVi Error = TranslationsErrorVi.internal(_root);
}

// Path: MainTab
class TranslationsMainTabVi {
	TranslationsMainTabVi.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get Home => 'Trang chủ';
	String get Map => 'Bản đồ';
	String get Explore => 'Khám phá';
	String get Collection => 'Bộ sưu tập';
	String get Settings => 'Cài đặt';
}

// Path: CommonAction
class TranslationsCommonActionVi {
	TranslationsCommonActionVi.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get MainNavigation => 'Điều hướng chính';
	String get EditFunction => 'Chỉnh sửa chức năng';
	String get Ok => 'Đồng ý';
	String get Close => 'Đóng';
	String get Confirm => 'Xác nhận';
	String get Cancel => 'Hủy';
	String get Canceled => 'Hủy bỏ';
	String get Skip => 'Bỏ qua';
	String get Back => 'Quay lại';
	String get Continue => 'Tiếp tục';
	String get Delete => 'Xóa';
	String get Edit => 'Tùy chỉnh';
	String get Complete => 'Hoàn tất';
	String get Update => 'Lưu chỉnh sửa';
	String get Save => 'Lưu';
	String get Resend => 'Gửi lại';
	String get Submit => 'Đồng ý';
	String get NoSubmit => 'Không đồng ý';
	String get Copy => 'Sao chép';
	String get Copied => 'Đã sao chép';
	String get CopyLink => 'Sao chép liên kết';
	String get Search => 'Tìm kiếm';
	String get Sending => 'Đang gửi';
	String get EnterText => 'Nhập văn bản';
	String get Dismiss => 'Loại bỏ';
	String get ViewDetail => 'Xem chi tiết';
	String get Add => 'Thêm';
	String get Download => 'Tải xuống';
	String get Login => 'Đăng nhập';
	String get Register => 'Đăng ký';
	String get Logout => 'Đăng xuất';
	String get ShowMore => 'Xem thêm';
	String get ShowLess => 'Thu gọn';
	String get TapOnUpload => 'Chạm để tải lên';
	String get ConfirmBeforeLeaveForm => 'Bạn có những thay đổi chưa được lưu. Bạn có chắc chắn muốn rời khỏi trang này không?';
	String get Share => 'Chia sẻ';
	String get DeleteFilter => 'Xoá bộ lọc';
}

// Path: CommonData
class TranslationsCommonDataVi {
	TranslationsCommonDataVi.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get Required => 'Bắt buộc';
	String get Menu => 'Thực đơn';
	String get Account => 'Tài khoản';
	String get Setting => 'Cài đặt';
	String get Email => 'Email';
	String get Password => 'Mật khẩu';
	String get NotUpdate => 'Không cập nhật';
	String get Today => 'Hôm nay';
	String get Yesterday => 'Hôm qua';
	String get Now => 'Hiện nay';
	String Minute({required Object value}) => '${value}phút';
	String Hour({required Object value}) => '${value}giờ';
	String Day({required Object value}) => '${value}ngày';
	String Week({required Object value}) => '${value}tuần';
	String Month({required Object value}) => '${value}tháng';
	String Year({required Object value}) => '${value}năm';
	String TimeToday({required Object value}) => '${value} thời gian trong ngày';
	String TimeYesterday({required Object value}) => '${value} thời gian ngày hôm qua';
	String get To => 'Giá trị';
	String get Error => 'Lỗi';
	String get UploadAFile => 'Tải lên một tài liệu';
	String get SelectImageOrVideo => 'Chọn hình ảnh hoặc video';
	String get TakeAPhoto => 'Chụp ảnh';
	String get UploadFrom => 'Tải lên từ';
	String get LoadingMore => 'Tải thêm';
	String get JapanCurrency => 'Yên';
	String get Gallery => 'Bộ sưu tập';
	String get GetBackWithoutSaveConfirm => 'Dữ liệu hiện tại chưa được lưu. ';
	String get ListDataIsEmpty => 'Chưa có dữ liệu';
	String get HasErrorOccurr => 'một lỗi đã xảy ra';
	String get CantLoadData => 'Không thể tải dữ liệu';
	String get PleaseFillFullInfo => 'Không thể tải xuống dữ liệu';
	String get About => 'Về';
	String get FeaturePending => 'Tính năng này đang được phát triển';
	String get Currency => 'VNĐ';
	String get Male => 'Nam giới';
	String get Female => 'Nữ giới';
	String get OtherGender => 'Giới tính khác';
	String get Gender => 'Giới tính';
	String get Job => 'Công việc';
	String get Visa => 'Hộ chiếu';
	String get Passport => 'Hộ chiếu';
	String get Credentials => 'Thông tin xác thực';
	String get Manage => 'Quản lý';
	String get ManageNote => 'Bạn đã cấp cho ứng quyền truy cập vào một số ảnh và video';
	String get LoginExpried => 'Phiên đăng nhập đã hết hạn. Vui lòng đăng nhập để tiếp tục.';
	String get ErrorFileSelect => 'Vui lòng chỉ tải lên các tệp PDF và JPEG';
	String get PleaseSelect => 'Vui lòng chọn';
	String get NoData => 'Không có dữ liệu';
}

// Path: CommonNotiAction
class TranslationsCommonNotiActionVi {
	TranslationsCommonNotiActionVi.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get Success => 'Thành công';
	String get YourActionMakingSuccessfully => 'Hành động của bạn đã được hoàn thành thành công!';
	String get Failed => 'Thất bại';
	String get YourActionMakingFailed => 'Hành động của bạn đã không thành công!';
	String get DownloadFile => 'Bạn có chắc chắn muốn tải xuống tệp này không?';
	String DownloadFileSuccessfully({required Object filename}) => 'Tải xuống tệp (${filename}) thành công!';
}

// Path: CommonValidation
class TranslationsCommonValidationVi {
	TranslationsCommonValidationVi.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get InvalidEmailFormat => 'Định dạng email không chính xác.';
	String get InvalidEmailEmpty => 'Nhập địa chỉ email';
	String get EmailAlreadyInUse => 'Địa chỉ email này đã được sử dụng.';
	String get InvalidPasswordFormat => 'Mật khẩu của bạn phải có ít nhất 8 ký tự, 1 ký tự số, 1 chữ hoa, 1 chữ thường.';
	String get PasswordConfirmationNotMatch => 'Xác nhận mật khẩu không khớp.';
	String get NewPasswordConfirmationNotMatch => 'Xác nhận mật khẩu mới không khớp.';
	String get NewPasswordCanNotSameOldPassword => 'Mật khẩu mới không được giống với mật khẩu cũ.';
	String MaxLength({required Object fieldName, required Object value}) => '${fieldName} không được nhiều hơn ${value} ký tự.';
	String MinLength({required Object fieldName, required Object value}) => '${fieldName} phải chứa ít nhất ${value} ký tự.';
	String MaxValue({required Object fieldName, required Object value}) => '${fieldName} không được vượt quá ${value}.';
	String MinValue({required Object fieldName, required Object value}) => '${fieldName} không thể nhỏ hơn ${value}.';
	String Required({required Object fieldName}) => '${fieldName} là bắt buộc.';
	String get CommonRequired => 'Trường dữ liệu này là bắt buộc.';
	String FieldInvalidate({required Object fieldName}) => '${fieldName} không có định dạng đúng.';
	String OnlyNumberAllow({required Object fieldName}) => '${fieldName} chỉ có thể nhập số.';
	String get DateTimeFormatIsInvalid => 'Dữ liệu đã nhập không đúng định dạng ngày.';
	String get PleaseChooseDifferenceImage => 'Vui lòng không chọn hình ảnh trùng lặp';
	String get FileSizeMustLessThan10MB => 'Kích thước tệp không được vượt quá 10Mb.';
	String get ListFileHasOneOrMoreFileSizeBiggerThan10MB => 'Danh sách file bạn chọn chứa 1 hoặc nhiều file có dung lượng lớn hơn 10Mb, những file này sẽ bị xóa.';
	String get ImageSizeMustLessThan10MB => 'Kích thước hình ảnh không được vượt quá 10Mb.';
	String get TotalFileSizeMustLessThan10MB => 'Tổng kích thước tệp không thể vượt quá 10Mb.';
	String get TotalImageSizeMustLessThan10MB => 'Tổng kích thước hình ảnh không được vượt quá 10Mb.';
}

// Path: Permission
class TranslationsPermissionVi {
	TranslationsPermissionVi.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get NotAnyVisibleCamera => 'Không có máy ảnh nào khả dụng';
	String get PleaseAcceptCameraPermission => 'Vui lòng cho phép quyền truy cập vào camera của thiết bị';
	String get CameraPermissionPurpose => 'Ứng dụng dùng camera của thiết bị để chụp ảnh';
	String get PleaseAcceptContactPermission => 'Vui lòng cho phép quyền truy cập vào danh sách liên hệ của thiết bị';
	String get ContactPermissionPurpose => 'Ứng dụng dùng danh sách liên hệ của thiết bị để tạo danh sách khách hàng thân thiết';
	String get No => 'Không';
	String get Yes => 'Đồng ý';
	String get GalleryPermissionPurpose => 'Ứng dụng sử dụng ảnh trong thư viện';
	String get CanNotAccessGalleryPermission => 'Không thể truy cập thư viện ảnh vì quyền truy cập bị từ chối';
	String get PleaseAccessGalleryPermission => 'Vui lòng cho phép quyền truy cập vào thư viện ảnh';
}

// Path: LostConnection
class TranslationsLostConnectionVi {
	TranslationsLostConnectionVi.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get LostConnection => 'Mất kết nối';
	String get PleaseCheckConnection => 'Vui lòng kiểm tra kết nối mạng của bạn hoặc thử lại.';
	String get Retry => 'Kết nối lại';
}

// Path: Placeholder
class TranslationsPlaceholderVi {
	TranslationsPlaceholderVi.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String InputFieldPlaceholder({required Object fieldName}) => 'Nhập ${fieldName}';
	String SelectFieldPlaceholder({required Object fieldName}) => 'Lựa chọn ${fieldName}';
	String get DateTimeFieldPlaceholder => 'Chọn ngày';
	String SearchPlaceHolder({required Object fieldName}) => 'Tìm kiếm ${fieldName}';
	String get UploadFilePlaceHolder => 'Chọn tệp';
}

// Path: Error
class TranslationsErrorVi {
	TranslationsErrorVi.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get Errtb0101 => 'Thời gian đặt lịch không hợp lệ.';
	String get Valbqr0108 => 'Thời gian kết thúc không được để trống';
	String get Valatr0601 => 'Số lượng không được để trống';
	String get UnexpectedError => 'Một lỗi không mong muốn đã xảy ra.';
	String get SendTimeoutError => 'Đã xảy ra lỗi thời gian chờ truyền khi kết nối với máy chủ API.';
	String get ConnectionTimeoutError => 'Hết thời gian kết nối với máy chủ API.';
	String get CancalledApiError => 'Yêu cầu tới máy chủ API đã bị hủy.';
	String get ConnectionError => 'Kết nối với máy chủ API không thành công do kết nối Internet.';
	String get ReceiveTimeoutError => 'Lỗi nhận thời gian chờ khi kết nối với máy chủ API.';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on Translations {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'Name': return 'Bio Explore';
			case 'MainTab.Home': return 'Trang chủ';
			case 'MainTab.Map': return 'Bản đồ';
			case 'MainTab.Explore': return 'Khám phá';
			case 'MainTab.Collection': return 'Bộ sưu tập';
			case 'MainTab.Settings': return 'Cài đặt';
			case 'CommonAction.MainNavigation': return 'Điều hướng chính';
			case 'CommonAction.EditFunction': return 'Chỉnh sửa chức năng';
			case 'CommonAction.Ok': return 'Đồng ý';
			case 'CommonAction.Close': return 'Đóng';
			case 'CommonAction.Confirm': return 'Xác nhận';
			case 'CommonAction.Cancel': return 'Hủy';
			case 'CommonAction.Canceled': return 'Hủy bỏ';
			case 'CommonAction.Skip': return 'Bỏ qua';
			case 'CommonAction.Back': return 'Quay lại';
			case 'CommonAction.Continue': return 'Tiếp tục';
			case 'CommonAction.Delete': return 'Xóa';
			case 'CommonAction.Edit': return 'Tùy chỉnh';
			case 'CommonAction.Complete': return 'Hoàn tất';
			case 'CommonAction.Update': return 'Lưu chỉnh sửa';
			case 'CommonAction.Save': return 'Lưu';
			case 'CommonAction.Resend': return 'Gửi lại';
			case 'CommonAction.Submit': return 'Đồng ý';
			case 'CommonAction.NoSubmit': return 'Không đồng ý';
			case 'CommonAction.Copy': return 'Sao chép';
			case 'CommonAction.Copied': return 'Đã sao chép';
			case 'CommonAction.CopyLink': return 'Sao chép liên kết';
			case 'CommonAction.Search': return 'Tìm kiếm';
			case 'CommonAction.Sending': return 'Đang gửi';
			case 'CommonAction.EnterText': return 'Nhập văn bản';
			case 'CommonAction.Dismiss': return 'Loại bỏ';
			case 'CommonAction.ViewDetail': return 'Xem chi tiết';
			case 'CommonAction.Add': return 'Thêm';
			case 'CommonAction.Download': return 'Tải xuống';
			case 'CommonAction.Login': return 'Đăng nhập';
			case 'CommonAction.Register': return 'Đăng ký';
			case 'CommonAction.Logout': return 'Đăng xuất';
			case 'CommonAction.ShowMore': return 'Xem thêm';
			case 'CommonAction.ShowLess': return 'Thu gọn';
			case 'CommonAction.TapOnUpload': return 'Chạm để tải lên';
			case 'CommonAction.ConfirmBeforeLeaveForm': return 'Bạn có những thay đổi chưa được lưu. Bạn có chắc chắn muốn rời khỏi trang này không?';
			case 'CommonAction.Share': return 'Chia sẻ';
			case 'CommonAction.DeleteFilter': return 'Xoá bộ lọc';
			case 'CommonData.Required': return 'Bắt buộc';
			case 'CommonData.Menu': return 'Thực đơn';
			case 'CommonData.Account': return 'Tài khoản';
			case 'CommonData.Setting': return 'Cài đặt';
			case 'CommonData.Email': return 'Email';
			case 'CommonData.Password': return 'Mật khẩu';
			case 'CommonData.NotUpdate': return 'Không cập nhật';
			case 'CommonData.Today': return 'Hôm nay';
			case 'CommonData.Yesterday': return 'Hôm qua';
			case 'CommonData.Now': return 'Hiện nay';
			case 'CommonData.Minute': return ({required Object value}) => '${value}phút';
			case 'CommonData.Hour': return ({required Object value}) => '${value}giờ';
			case 'CommonData.Day': return ({required Object value}) => '${value}ngày';
			case 'CommonData.Week': return ({required Object value}) => '${value}tuần';
			case 'CommonData.Month': return ({required Object value}) => '${value}tháng';
			case 'CommonData.Year': return ({required Object value}) => '${value}năm';
			case 'CommonData.TimeToday': return ({required Object value}) => '${value} thời gian trong ngày';
			case 'CommonData.TimeYesterday': return ({required Object value}) => '${value} thời gian ngày hôm qua';
			case 'CommonData.To': return 'Giá trị';
			case 'CommonData.Error': return 'Lỗi';
			case 'CommonData.UploadAFile': return 'Tải lên một tài liệu';
			case 'CommonData.SelectImageOrVideo': return 'Chọn hình ảnh hoặc video';
			case 'CommonData.TakeAPhoto': return 'Chụp ảnh';
			case 'CommonData.UploadFrom': return 'Tải lên từ';
			case 'CommonData.LoadingMore': return 'Tải thêm';
			case 'CommonData.JapanCurrency': return 'Yên';
			case 'CommonData.Gallery': return 'Bộ sưu tập';
			case 'CommonData.GetBackWithoutSaveConfirm': return 'Dữ liệu hiện tại chưa được lưu. ';
			case 'CommonData.ListDataIsEmpty': return 'Chưa có dữ liệu';
			case 'CommonData.HasErrorOccurr': return 'một lỗi đã xảy ra';
			case 'CommonData.CantLoadData': return 'Không thể tải dữ liệu';
			case 'CommonData.PleaseFillFullInfo': return 'Không thể tải xuống dữ liệu';
			case 'CommonData.About': return 'Về';
			case 'CommonData.FeaturePending': return 'Tính năng này đang được phát triển';
			case 'CommonData.Currency': return 'VNĐ';
			case 'CommonData.Male': return 'Nam giới';
			case 'CommonData.Female': return 'Nữ giới';
			case 'CommonData.OtherGender': return 'Giới tính khác';
			case 'CommonData.Gender': return 'Giới tính';
			case 'CommonData.Job': return 'Công việc';
			case 'CommonData.Visa': return 'Hộ chiếu';
			case 'CommonData.Passport': return 'Hộ chiếu';
			case 'CommonData.Credentials': return 'Thông tin xác thực';
			case 'CommonData.Manage': return 'Quản lý';
			case 'CommonData.ManageNote': return 'Bạn đã cấp cho ứng quyền truy cập vào một số ảnh và video';
			case 'CommonData.LoginExpried': return 'Phiên đăng nhập đã hết hạn. Vui lòng đăng nhập để tiếp tục.';
			case 'CommonData.ErrorFileSelect': return 'Vui lòng chỉ tải lên các tệp PDF và JPEG';
			case 'CommonData.PleaseSelect': return 'Vui lòng chọn';
			case 'CommonData.NoData': return 'Không có dữ liệu';
			case 'CommonNotiAction.Success': return 'Thành công';
			case 'CommonNotiAction.YourActionMakingSuccessfully': return 'Hành động của bạn đã được hoàn thành thành công!';
			case 'CommonNotiAction.Failed': return 'Thất bại';
			case 'CommonNotiAction.YourActionMakingFailed': return 'Hành động của bạn đã không thành công!';
			case 'CommonNotiAction.DownloadFile': return 'Bạn có chắc chắn muốn tải xuống tệp này không?';
			case 'CommonNotiAction.DownloadFileSuccessfully': return ({required Object filename}) => 'Tải xuống tệp (${filename}) thành công!';
			case 'CommonValidation.InvalidEmailFormat': return 'Định dạng email không chính xác.';
			case 'CommonValidation.InvalidEmailEmpty': return 'Nhập địa chỉ email';
			case 'CommonValidation.EmailAlreadyInUse': return 'Địa chỉ email này đã được sử dụng.';
			case 'CommonValidation.InvalidPasswordFormat': return 'Mật khẩu của bạn phải có ít nhất 8 ký tự, 1 ký tự số, 1 chữ hoa, 1 chữ thường.';
			case 'CommonValidation.PasswordConfirmationNotMatch': return 'Xác nhận mật khẩu không khớp.';
			case 'CommonValidation.NewPasswordConfirmationNotMatch': return 'Xác nhận mật khẩu mới không khớp.';
			case 'CommonValidation.NewPasswordCanNotSameOldPassword': return 'Mật khẩu mới không được giống với mật khẩu cũ.';
			case 'CommonValidation.MaxLength': return ({required Object fieldName, required Object value}) => '${fieldName} không được nhiều hơn ${value} ký tự.';
			case 'CommonValidation.MinLength': return ({required Object fieldName, required Object value}) => '${fieldName} phải chứa ít nhất ${value} ký tự.';
			case 'CommonValidation.MaxValue': return ({required Object fieldName, required Object value}) => '${fieldName} không được vượt quá ${value}.';
			case 'CommonValidation.MinValue': return ({required Object fieldName, required Object value}) => '${fieldName} không thể nhỏ hơn ${value}.';
			case 'CommonValidation.Required': return ({required Object fieldName}) => '${fieldName} là bắt buộc.';
			case 'CommonValidation.CommonRequired': return 'Trường dữ liệu này là bắt buộc.';
			case 'CommonValidation.FieldInvalidate': return ({required Object fieldName}) => '${fieldName} không có định dạng đúng.';
			case 'CommonValidation.OnlyNumberAllow': return ({required Object fieldName}) => '${fieldName} chỉ có thể nhập số.';
			case 'CommonValidation.DateTimeFormatIsInvalid': return 'Dữ liệu đã nhập không đúng định dạng ngày.';
			case 'CommonValidation.PleaseChooseDifferenceImage': return 'Vui lòng không chọn hình ảnh trùng lặp';
			case 'CommonValidation.FileSizeMustLessThan10MB': return 'Kích thước tệp không được vượt quá 10Mb.';
			case 'CommonValidation.ListFileHasOneOrMoreFileSizeBiggerThan10MB': return 'Danh sách file bạn chọn chứa 1 hoặc nhiều file có dung lượng lớn hơn 10Mb, những file này sẽ bị xóa.';
			case 'CommonValidation.ImageSizeMustLessThan10MB': return 'Kích thước hình ảnh không được vượt quá 10Mb.';
			case 'CommonValidation.TotalFileSizeMustLessThan10MB': return 'Tổng kích thước tệp không thể vượt quá 10Mb.';
			case 'CommonValidation.TotalImageSizeMustLessThan10MB': return 'Tổng kích thước hình ảnh không được vượt quá 10Mb.';
			case 'Permission.NotAnyVisibleCamera': return 'Không có máy ảnh nào khả dụng';
			case 'Permission.PleaseAcceptCameraPermission': return 'Vui lòng cho phép quyền truy cập vào camera của thiết bị';
			case 'Permission.CameraPermissionPurpose': return 'Ứng dụng dùng camera của thiết bị để chụp ảnh';
			case 'Permission.PleaseAcceptContactPermission': return 'Vui lòng cho phép quyền truy cập vào danh sách liên hệ của thiết bị';
			case 'Permission.ContactPermissionPurpose': return 'Ứng dụng dùng danh sách liên hệ của thiết bị để tạo danh sách khách hàng thân thiết';
			case 'Permission.No': return 'Không';
			case 'Permission.Yes': return 'Đồng ý';
			case 'Permission.GalleryPermissionPurpose': return 'Ứng dụng sử dụng ảnh trong thư viện';
			case 'Permission.CanNotAccessGalleryPermission': return 'Không thể truy cập thư viện ảnh vì quyền truy cập bị từ chối';
			case 'Permission.PleaseAccessGalleryPermission': return 'Vui lòng cho phép quyền truy cập vào thư viện ảnh';
			case 'LostConnection.LostConnection': return 'Mất kết nối';
			case 'LostConnection.PleaseCheckConnection': return 'Vui lòng kiểm tra kết nối mạng của bạn hoặc thử lại.';
			case 'LostConnection.Retry': return 'Kết nối lại';
			case 'Placeholder.InputFieldPlaceholder': return ({required Object fieldName}) => 'Nhập ${fieldName}';
			case 'Placeholder.SelectFieldPlaceholder': return ({required Object fieldName}) => 'Lựa chọn ${fieldName}';
			case 'Placeholder.DateTimeFieldPlaceholder': return 'Chọn ngày';
			case 'Placeholder.SearchPlaceHolder': return ({required Object fieldName}) => 'Tìm kiếm ${fieldName}';
			case 'Placeholder.UploadFilePlaceHolder': return 'Chọn tệp';
			case 'Error.Errtb0101': return 'Thời gian đặt lịch không hợp lệ.';
			case 'Error.Valbqr0108': return 'Thời gian kết thúc không được để trống';
			case 'Error.Valatr0601': return 'Số lượng không được để trống';
			case 'Error.UnexpectedError': return 'Một lỗi không mong muốn đã xảy ra.';
			case 'Error.SendTimeoutError': return 'Đã xảy ra lỗi thời gian chờ truyền khi kết nối với máy chủ API.';
			case 'Error.ConnectionTimeoutError': return 'Hết thời gian kết nối với máy chủ API.';
			case 'Error.CancalledApiError': return 'Yêu cầu tới máy chủ API đã bị hủy.';
			case 'Error.ConnectionError': return 'Kết nối với máy chủ API không thành công do kết nối Internet.';
			case 'Error.ReceiveTimeoutError': return 'Lỗi nhận thời gian chờ khi kết nối với máy chủ API.';
			default: return null;
		}
	}
}

