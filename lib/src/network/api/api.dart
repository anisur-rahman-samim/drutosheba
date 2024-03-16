class Api{
  /// base url
  static const domain = "https://carbook.cutiaidcorporation.com";
  static const baseUrl = "$domain/api/v1";
  static String getImageURL(endPoint) => '$domain/$endPoint';


  ///Auth
  static const login = "$baseUrl/partner/login";//done
  static const register = "$baseUrl/partner/register";//done
  static const registerProfile = "$baseUrl/partner/register-step"; //done 11
  static const verify = "$baseUrl/partner/verify";//done
  static const resend = "$baseUrl/partner/resend-otp";//done
  static const forgot = "$baseUrl/partner/forgot-password";//done
  static const resendForgot = "$baseUrl/partner/resend-forgot";//done
  static const forgotVerify = "$baseUrl/partner/forgot-verify";//done
  static const profile = "$baseUrl/partner/profile"; //done
  static const profileUpdate = "$baseUrl/partner/profile-update";

  ///Rental Trip
  static const tripRequest = "$baseUrl/partner/trip-request"; // done
  static const tripCancel = "$baseUrl/partner/trip-cancel"; // working
  static const tripStarted = "$baseUrl/partner/trip-started";
  static const tripCompleted = "$baseUrl/partner/trip-completed";
  static const tripBidSubmit = "$baseUrl/partner/trip-bid/submit"; 
  static const waitingBid = "$baseUrl/partner/waiting-bid"; // working
  static const tripDetails = "$baseUrl/partner/trip-details";

  ///Driver
  static const driverManage = "$baseUrl/partner/driver-manage";//done 11
  static const driverAdd = "$baseUrl/partner/driver-add"; // done 11

  ///Penalty and Balance
  static const credit = "$baseUrl/partner/credit"; // done
  static const creditHistory = "$baseUrl/partner/credit-history"; // done
  static const dashboard = "$baseUrl/partner/dashboard"; // done, but ui change need
  static const leaderboard = "$baseUrl/partner/leaderboard"; // done
  static const withdrawalSubmit = "$baseUrl/partner/withdrawal-submit"; // pending
  static const creditBuy = "$baseUrl/partner/credit-buy"; // pending
  static const penaltyHistory = "$baseUrl/partner/penalty-history"; // working

  ///Return Trip
  static const returnTripSubmit = "$baseUrl/partner/return-trip-submit"; //done
  static const returnTripBids = "$baseUrl/partner/return-trip-bids"; // done
  static const returnTripList = "$baseUrl/partner/return-trip-lists"; // done
  static const returnTripConfirm = "$baseUrl/partner/return-trip-confirm"; // done

  ///Vehicle
  static const vehicles = "$baseUrl/partner/vehicles"; // done
  static const vehicleManage = "$baseUrl/partner/vehicle-manage"; // done
  static const fuelTypes = "$baseUrl/partner/fueltypes"; // done
  static const vehicleAdd = "$baseUrl/partner/vehicle-add"; //done
  static const returnTripCompleted = "$baseUrl/partner/return-trip-completed"; // done
  static const metroList = "$baseUrl/partner/metro-list"; // done
  static const metroSubList = "$baseUrl/partner/metro-sub-list"; // done

  ///common
  static const districts = "$baseUrl/partner/districts";
  static const divisions = "$baseUrl/partner/divisions"; //done 10
  static const shareReferKey = "$baseUrl/partner/share-referkey";
  static const offer = "$baseUrl/partner/offer";
  static const help = "$baseUrl/partner/help";
}