// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../../data/data_sources/auth/auth_remote_data_source.dart' as _i444;
import '../../../data/data_sources/auth/auth_storage_data_source.dart' as _i244;
import '../../../data/data_sources/bank_account/bank_account_remote_data_source.dart'
    as _i908;
import '../../../data/data_sources/banner/banner_remote_data_source.dart'
    as _i805;
import '../../../data/data_sources/cms/cms_remote_data_source.dart' as _i250;
import '../../../data/data_sources/email/email_remote_data_source.dart'
    as _i512;
import '../../../data/data_sources/media/media_remote_data_source.dart'
    as _i769;
import '../../../data/data_sources/meta/meta_remote_data_source.dart' as _i748;
import '../../../data/data_sources/notifications/notifications_remote_data_source.dart'
    as _i334;
import '../../../data/data_sources/profile/profile_remote_data_source.dart'
    as _i265;
import '../../../data/data_sources/property/property_remote_data_source.dart'
    as _i609;
import '../../../data/data_sources/wallet_top_up/wallet_top_up_remote_data_source.dart'
    as _i81;
import '../../../data/data_sources/wallet_transactions/wallet_transactions_remote_data_source.dart'
    as _i226;
import '../../../data/model/auth/auth_model.dart' as _i49;
import '../../../data/model/bank_account/bank_account_model.dart' as _i322;
import '../../../data/model/banner/banner_model.dart' as _i98;
import '../../../data/model/base/base_model.dart' as _i830;
import '../../../data/model/cmc/cmc_model.dart' as _i182;
import '../../../data/model/media/media_model.dart' as _i549;
import '../../../data/model/meta/meta_model.dart' as _i84;
import '../../../data/model/notifications/notifications_model.dart' as _i793;
import '../../../data/model/pagination/pagination_model.dart' as _i497;
import '../../../data/model/profile/profile_model.dart' as _i967;
import '../../../data/model/property/property_model.dart' as _i454;
import '../../../data/model/wallet_top_up/wallet_top_up_model.dart' as _i838;
import '../../../data/model/wallet_transactions/wallet_transactions_model.dart'
    as _i406;
import '../../../data/repository/auth/auth_repository.dart' as _i728;
import '../../../data/repository/bank_account/bank_account_repository.dart'
    as _i788;
import '../../../data/repository/banner/banner_repository.dart' as _i751;
import '../../../data/repository/cms/cms_repository.dart' as _i747;
import '../../../data/repository/email/email_repository.dart' as _i181;
import '../../../data/repository/media/media_repository.dart' as _i1047;
import '../../../data/repository/meta/meta_repository.dart' as _i74;
import '../../../data/repository/notifications/notifications_repository.dart'
    as _i639;
import '../../../data/repository/profile/profile_repository.dart' as _i732;
import '../../../data/repository/property/property_repository.dart' as _i335;
import '../../../data/repository/wallet_top_up/wallet_top_up_repository.dart'
    as _i842;
import '../../../data/repository/wallet_transactions/wallet_transactions_repository.dart'
    as _i122;
import '../../../domain/entity/auth/auth_entity.dart' as _i250;
import '../../../domain/entity/bank_account/bank_account_entity.dart' as _i757;
import '../../../domain/entity/banner/banner_entity.dart' as _i496;
import '../../../domain/entity/cms/cms_entity.dart' as _i48;
import '../../../domain/entity/media/media_entity.dart' as _i531;
import '../../../domain/entity/meta/meta_entity.dart' as _i778;
import '../../../domain/entity/notifications/notifications_delete_entity.dart'
    as _i976;
import '../../../domain/entity/notifications/notifications_entity.dart'
    as _i767;
import '../../../domain/entity/notifications/notifications_read_entity.dart'
    as _i288;
import '../../../domain/entity/profile/profile_entity.dart' as _i781;
import '../../../domain/entity/property/property_entity.dart' as _i494;
import '../../../domain/entity/wallet_top_up/wallet_top_up_entity.dart' as _i98;
import '../../../domain/entity/wallet_transactions/wallet_transactions_entity.dart'
    as _i588;
import '../../../domain/repository/auth/i_auth_repository.dart' as _i154;
import '../../../domain/repository/bank_account/i_bank_account_repository.dart'
    as _i388;
import '../../../domain/repository/banner/i_banner_repository.dart' as _i448;
import '../../../domain/repository/cms/i_cms_repository.dart' as _i489;
import '../../../domain/repository/email/i_email_repository.dart' as _i52;
import '../../../domain/repository/media/i_media_repository.dart' as _i243;
import '../../../domain/repository/meta/i_meta_repository.dart' as _i407;
import '../../../domain/repository/notifications/i_notifications_repository.dart'
    as _i919;
import '../../../domain/repository/profile/i_profile_repository.dart' as _i950;
import '../../../domain/repository/property/i_property_repository.dart'
    as _i166;
import '../../../domain/repository/wallet_top_up/i_wallet_top_up_repository.dart'
    as _i278;
import '../../../domain/repository/wallet_transactions/i_wallet_transactions_repository.dart'
    as _i767;
import '../../../domain/usecase/auth/check_code_usecase.dart' as _i70;
import '../../../domain/usecase/auth/login_usecase.dart' as _i10;
import '../../../domain/usecase/auth/logout_usecase.dart' as _i659;
import '../../../domain/usecase/auth/resend_code_usecase.dart' as _i850;
import '../../../domain/usecase/bank_account/index_bank_account_usecase.dart'
    as _i529;
import '../../../domain/usecase/banner/get_banner_usecase.dart' as _i925;
import '../../../domain/usecase/cms/get_content_usecase.dart' as _i574;
import '../../../domain/usecase/cms/get_intellectual_property_rights_usecase.dart'
    as _i71;
import '../../../domain/usecase/cms/get_privacy_policies_usecase.dart' as _i872;
import '../../../domain/usecase/cms/get_success_partners_usecase.dart' as _i359;
import '../../../domain/usecase/cms/get_terms_and_conditions_usecase.dart'
    as _i154;
import '../../../domain/usecase/email/send_otp_usecase.dart' as _i697;
import '../../../domain/usecase/email/verify_otp_usecase.dart' as _i392;
import '../../../domain/usecase/i_use_case.dart' as _i759;
import '../../../domain/usecase/media/remove_media_usecase.dart' as _i355;
import '../../../domain/usecase/media/upload_media_usecase.dart' as _i214;
import '../../../domain/usecase/meta/get_meta_usecase.dart' as _i6;
import '../../../domain/usecase/notifications/delete_notifications_usecase.dart'
    as _i677;
import '../../../domain/usecase/notifications/index_notifications_usecase.dart'
    as _i134;
import '../../../domain/usecase/notifications/mark_as_read_notifications_usecase.dart'
    as _i329;
import '../../../domain/usecase/profile/show_profile_usecase.dart' as _i468;
import '../../../domain/usecase/profile/update_profile_usecase.dart' as _i999;
import '../../../domain/usecase/property/get_properties_usecase.dart' as _i372;
import '../../../domain/usecase/property/show_property_usecase.dart' as _i763;
import '../../../domain/usecase/wallet_top_up/archive_wallet_top_up_usecase.dart'
    as _i830;
import '../../../domain/usecase/wallet_top_up/index_wallet_top_up_usecase.dart'
    as _i525;
import '../../../domain/usecase/wallet_top_up/show_wallet_top_up_usecase.dart'
    as _i495;
import '../../../domain/usecase/wallet_top_up/store_wallet_top_up_usecase.dart'
    as _i394;
import '../../../domain/usecase/wallet_top_up/update_wallet_top_up_usecase.dart'
    as _i406;
import '../../../domain/usecase/wallet_transactions/index_wallet_transactions_usecase.dart'
    as _i10;
import '../../../domain/usecase/wallet_transactions/show_wallet_transactions_usecase.dart'
    as _i118;
import '../../helper/local_storage_helper.dart' as _i218;
import '../../helper/network_helper.dart' as _i779;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i218.LocalStorageHelper>(() => _i218.LocalStorageHelper());
    gh.factory<_i779.NetworkHelper>(() => _i779.NetworkHelper());
    gh.factory<_i444.AuthRemoteDataSource>(() => _i444.AuthRemoteDataSource());
    gh.factory<_i244.AuthStorageDataSource>(
      () => _i244.AuthStorageDataSource(),
    );
    gh.factory<_i908.BankAccountRemoteDataSource>(
      () => _i908.BankAccountRemoteDataSource(),
    );
    gh.factory<_i805.BannerRemoteDataSource>(
      () => _i805.BannerRemoteDataSource(),
    );
    gh.factory<_i250.CmsRemoteDataSource>(() => _i250.CmsRemoteDataSource());
    gh.factory<_i512.EmailRemoteDataSource>(
      () => _i512.EmailRemoteDataSource(),
    );
    gh.factory<_i769.MediaRemoteDataSource>(
      () => _i769.MediaRemoteDataSource(),
    );
    gh.factory<_i748.MetaRemoteDataSource>(() => _i748.MetaRemoteDataSource());
    gh.factory<_i334.NotificationsRemoteDataSource>(
      () => _i334.NotificationsRemoteDataSource(),
    );
    gh.factory<_i265.ProfileRemoteDataSource>(
      () => _i265.ProfileRemoteDataSource(),
    );
    gh.factory<_i609.PropertyRemoteDataSource>(
      () => _i609.PropertyRemoteDataSource(),
    );
    gh.factory<_i81.WalletTopUpRemoteDataSource>(
      () => _i81.WalletTopUpRemoteDataSource(),
    );
    gh.factory<_i226.WalletTransactionsRemoteDataSource>(
      () => _i226.WalletTransactionsRemoteDataSource(),
    );
    gh.factory<_i154.IAuthRepository>(
      () => _i728.AuthRepository(
        gh<_i444.AuthRemoteDataSource>(),
        gh<_i244.AuthStorageDataSource>(),
      ),
    );
    gh.factory<_i489.ICmsRepository>(
      () => _i747.CmsRepository(gh<_i250.CmsRemoteDataSource>()),
    );
    gh.factory<_i448.IBannerRepository>(
      () => _i751.BannerRepository(gh<_i805.BannerRemoteDataSource>()),
    );
    gh.factory<_i767.IWalletTransactionsRepository>(
      () => _i122.WalletTransactionsRepository(
        gh<_i226.WalletTransactionsRemoteDataSource>(),
      ),
    );
    gh.factory<_i52.IEmailRepository>(
      () => _i181.EmailRepository(gh<_i512.EmailRemoteDataSource>()),
    );
    gh.factory<_i243.IMediaRepository>(
      () => _i1047.MediaRepository(gh<_i769.MediaRemoteDataSource>()),
    );
    gh.factory<_i950.IProfileRepository>(
      () => _i732.ProfileRepository(gh<_i265.ProfileRemoteDataSource>()),
    );
    gh.factory<_i407.IMetaRepository>(
      () => _i74.MetaRepository(gh<_i748.MetaRemoteDataSource>()),
    );
    gh.factory<_i919.INotificationsRepository>(
      () => _i639.NotificationsRepository(
        gh<_i334.NotificationsRemoteDataSource>(),
      ),
    );
    gh.factory<
      _i759.IUseCase<
        _i830.BaseModel<_i497.PaginationModel<_i182.CmcModel>>?,
        _i48.CmsEntity
      >
    >(
      () =>
          _i71.GetIntellectualPropertyRightsUsecase(gh<_i489.ICmsRepository>()),
      instanceName: 'GetIntellectualPropertyRights',
    );
    gh.factory<
      _i759.IUseCase<_i830.BaseModel<_i967.ProfileModel>?, _i781.ProfileEntity>
    >(
      () => _i999.UpdateProfileUsecase(gh<_i950.IProfileRepository>()),
      instanceName: 'UpdateProfile',
    );
    gh.factory<
      _i759.IUseCase<
        _i830.BaseModel<_i497.PaginationModel<_i182.CmcModel>>?,
        _i48.CmsEntity
      >
    >(
      () => _i574.GetContentUsecase(gh<_i489.ICmsRepository>()),
      instanceName: 'GetCmsContent',
    );
    gh.factory<_i759.IUseCase<_i830.BaseModel<_i967.ProfileModel>?, Null>>(
      () => _i468.ShowProfileUsecase(gh<_i950.IProfileRepository>()),
      instanceName: 'ShowProfile',
    );
    gh.factory<
      _i759.IUseCase<
        _i830.BaseModel<_i497.PaginationModel<_i406.WalletTransactionsModel>>?,
        _i588.WalletTransactionsEntity
      >
    >(
      () => _i10.IndexWalletTransactionsUsecase(
        gh<_i767.IWalletTransactionsRepository>(),
      ),
      instanceName: 'IndexWalletTransactions',
    );
    gh.factory<_i166.IPropertyRepository>(
      () => _i335.PropertyRepository(gh<_i609.PropertyRemoteDataSource>()),
    );
    gh.factory<_i388.IBankAccountRepository>(
      () =>
          _i788.BankAccountRepository(gh<_i908.BankAccountRemoteDataSource>()),
    );
    gh.factory<_i531.MediaEntity>(
      () => _i531.MediaEntity(
        id: gh<int>(),
        modelName: gh<String>(),
        media: gh<List<Map<String, dynamic>>>(),
      ),
    );
    gh.factory<
      _i759.IUseCase<_i830.BaseModel<_i84.MetaModel>?, _i778.MetaEntity>
    >(
      () => _i6.GetMetaUsecase(gh<_i407.IMetaRepository>()),
      instanceName: 'GetMeta',
    );
    gh.factory<
      _i759.IUseCase<
        _i830.BaseModel<List<_i549.MediaModel>>?,
        _i531.MediaEntity
      >
    >(
      () => _i355.RemoveMediaUsecase(gh<_i243.IMediaRepository>()),
      instanceName: 'RemoveMedia',
    );
    gh.factory<
      _i759.IUseCase<_i830.BaseModel<_i49.AuthModel>?, _i250.AuthEntity>
    >(
      () => _i850.ResendCodeUsecase(gh<_i154.IAuthRepository>()),
      instanceName: 'ResendCode',
    );
    gh.factory<
      _i759.IUseCase<
        _i830.BaseModel<_i497.PaginationModel<_i182.CmcModel>>?,
        _i48.CmsEntity
      >
    >(
      () => _i872.GetPrivacyPoliciesUsecase(gh<_i489.ICmsRepository>()),
      instanceName: 'GetPrivacyPolicies',
    );
    gh.factory<
      _i759.IUseCase<_i830.BaseModel<_i49.AuthModel>?, _i250.AuthEntity>
    >(
      () => _i10.LoginUsecase(gh<_i154.IAuthRepository>()),
      instanceName: 'Login',
    );
    gh.factory<
      _i759.IUseCase<
        _i830.BaseModel<_i497.PaginationModel<_i793.NotificationsModel>>?,
        _i976.NotificationsDeleteEntity
      >
    >(
      () => _i677.DeleteNotificationsUsecase(
        gh<_i919.INotificationsRepository>(),
      ),
      instanceName: 'DeleteNotifications',
    );
    gh.factory<
      _i759.IUseCase<_i830.BaseModel<_i49.AuthModel>?, _i250.AuthEntity>
    >(
      () => _i70.CheckCodeUsecase(gh<_i154.IAuthRepository>()),
      instanceName: 'CheckCode',
    );
    gh.factory<_i278.IWalletTopUpRepository>(
      () => _i842.WalletTopUpRepository(gh<_i81.WalletTopUpRemoteDataSource>()),
    );
    gh.factory<
      _i759.IUseCase<
        _i830.BaseModel<_i497.PaginationModel<_i182.CmcModel>>?,
        _i48.CmsEntity
      >
    >(
      () => _i154.GetTermsAndConditionsUsecase(gh<_i489.ICmsRepository>()),
      instanceName: 'GetTermsAndConditions',
    );
    gh.factory<_i759.IUseCase<void, Null>>(
      () => _i659.LogoutUsecase(gh<_i154.IAuthRepository>()),
      instanceName: 'LogOut',
    );
    gh.factory<
      _i759.IUseCase<
        _i830.BaseModel<List<_i98.BannerModel>>?,
        _i496.BannerEntity
      >
    >(
      () => _i925.GetBannerUsecase(gh<_i448.IBannerRepository>()),
      instanceName: 'GetBanner',
    );
    gh.factory<
      _i759.IUseCase<
        _i830.BaseModel<_i497.PaginationModel<_i793.NotificationsModel>>?,
        _i288.NotificationsReadEntity
      >
    >(
      () => _i329.MarkAsReadNotificationsUsecase(
        gh<_i919.INotificationsRepository>(),
      ),
      instanceName: 'MarkAsReadNotifications',
    );
    gh.factory<_i250.AuthEntity>(
      () => _i250.AuthEntity(
        phone: gh<String>(),
        typeMessage: gh<String>(),
        code: gh<String>(),
        fcm: gh<String>(),
        rememberMe: gh<bool>(),
      ),
    );
    gh.factory<
      _i759.IUseCase<
        _i830.BaseModel<_i497.PaginationModel<_i182.CmcModel>>?,
        _i48.CmsEntity
      >
    >(
      () => _i359.GetSuccessPartnersUsecase(gh<_i489.ICmsRepository>()),
      instanceName: 'GetSuccessPartners',
    );
    gh.factory<
      _i759.IUseCase<
        _i830.BaseModel<_i497.PaginationModel<_i793.NotificationsModel>>?,
        _i767.NotificationsEntity
      >
    >(
      () =>
          _i134.IndexNotificationsUsecase(gh<_i919.INotificationsRepository>()),
      instanceName: 'IndexNotifications',
    );
    gh.factory<
      _i759.IUseCase<
        _i830.BaseModel<List<_i549.MediaModel>>?,
        _i531.MediaEntity
      >
    >(
      () => _i214.UploadMediaUsecase(gh<_i243.IMediaRepository>()),
      instanceName: 'UploadMedia',
    );
    gh.factory<
      _i759.IUseCase<
        _i830.BaseModel<_i497.PaginationModel<_i838.WalletTopUpModel>>?,
        _i98.WalletTopUpEntity
      >
    >(
      () => _i525.IndexWalletTopUpUsecase(gh<_i278.IWalletTopUpRepository>()),
      instanceName: 'IndexWalletTopUp',
    );
    gh.factory<
      _i759.IUseCase<
        _i830.BaseModel<_i406.WalletTransactionsModel>?,
        _i588.WalletTransactionsEntity
      >
    >(
      () => _i118.ShowWalletTransactionsUsecase(
        gh<_i767.IWalletTransactionsRepository>(),
      ),
      instanceName: 'ShowWalletTransactions',
    );
    gh.factory<
      _i759.IUseCase<
        _i830.BaseModel<_i454.PropertyModel>?,
        _i494.PropertyEntity
      >
    >(
      () => _i763.ShowPropertyUsecase(gh<_i166.IPropertyRepository>()),
      instanceName: 'ShowProperty',
    );
    gh.factory<
      _i759.IUseCase<_i830.BaseModel<_i49.AuthModel>?, _i781.ProfileEntity>
    >(
      () => _i697.SendOtpUsecase(gh<_i52.IEmailRepository>()),
      instanceName: 'SendOtp',
    );
    gh.factory<
      _i759.IUseCase<_i830.BaseModel<_i49.AuthModel>?, _i781.ProfileEntity>
    >(
      () => _i392.VerifyOtpUsecase(gh<_i52.IEmailRepository>()),
      instanceName: 'VerifyOtp',
    );
    gh.factory<
      _i759.IUseCase<
        _i830.BaseModel<_i497.PaginationModel<_i454.PropertyModel>>?,
        _i494.PropertyEntity
      >
    >(
      () => _i372.GetPropertiesUsecase(gh<_i166.IPropertyRepository>()),
      instanceName: 'GetProperties',
    );
    gh.factory<
      _i759.IUseCase<
        _i830.BaseModel<_i497.PaginationModel<_i322.BankAccountModel>>?,
        _i757.BankAccountEntity
      >
    >(
      () => _i529.IndexBankAccountUsecase(gh<_i388.IBankAccountRepository>()),
      instanceName: 'IndexBankAccount',
    );
    gh.factory<
      _i759.IUseCase<
        _i830.BaseModel<_i838.WalletTopUpModel>?,
        _i98.WalletTopUpEntity
      >
    >(
      () => _i830.ArchiveWalletTopUpUsecase(gh<_i278.IWalletTopUpRepository>()),
      instanceName: 'ArchiveWalletTopUp',
    );
    gh.factory<
      _i759.IUseCase<
        _i830.BaseModel<_i838.WalletTopUpModel>?,
        _i98.WalletTopUpEntity
      >
    >(
      () => _i495.ShowWalletTopUpUsecase(gh<_i278.IWalletTopUpRepository>()),
      instanceName: 'ShowWalletTopUp',
    );
    gh.factory<
      _i759.IUseCase<
        _i830.BaseModel<_i838.WalletTopUpModel>?,
        _i98.WalletTopUpEntity
      >
    >(
      () => _i394.StoreWalletTopUpUsecase(gh<_i278.IWalletTopUpRepository>()),
      instanceName: 'StoreWalletTopUp',
    );
    gh.factory<
      _i759.IUseCase<
        _i830.BaseModel<_i838.WalletTopUpModel>?,
        _i98.WalletTopUpEntity
      >
    >(
      () => _i406.UpdateWalletTopUpUsecase(gh<_i278.IWalletTopUpRepository>()),
      instanceName: 'UpdateWalletTopUp',
    );
    return this;
  }
}
