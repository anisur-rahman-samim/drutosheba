class Api{
  /// base url
  static const domain = "https://carbook.cutiaidcorporation.com";
  static const baseUrl = "$domain/api/v1";
  static String getImageURL(endPoint) => '$domain/$endPoint';


  ///Auth
  static const login = "$baseUrl/partner/login";//done
  static const register = "$baseUrl/partner/register";
  static const registerProfile = "$baseUrl/partner/register-step";
  static const verify = "$baseUrl/partner/verify";
  static const resend = "$baseUrl/partner/resend-otp";
  static const forgot = "$baseUrl/partner/forgot-password";
  static const resendForgot = "$baseUrl/partner/resend-forgot";
  static const forgotVerify = "$baseUrl/partner/forgot-verify";
  static const profile = "$baseUrl/partner/profile"; //done
  static const profileUpdate = "$baseUrl/partner/profile-update";

  ///Rental Trip
  static const tripRequest = "$baseUrl/partner/trip-request";
  static const tripCancel = "$baseUrl/partner/trip-cancel";
  static const tripHistory = "$baseUrl/partner/penalty-history";
  static const tripStarted = "$baseUrl/partner/trip-started";
  static const tripCompleted = "$baseUrl/partner/trip-completed";
  static const tripBidSubmit = "$baseUrl/partner/trip-bid/submit";
  static const waitingBid = "$baseUrl/partner/waiting-bid";
  static const tripDetails = "$baseUrl/partner/trip-details";

  ///Driver
  static const driverManage = "$baseUrl/partner/driver-manage";
  static const driverAdd = "$baseUrl/partner/driver-add";

  ///Penalty and Balance
  static const credit = "$baseUrl/partner/credit";
  static const creditHistory = "$baseUrl/partner/credit-history";
  static const dashboard = "$baseUrl/partner/dashboard";
  static const leaderboard = "$baseUrl/partner/leaderboard";
  static const withdrawalSubmit = "$baseUrl/partner/withdrawal-submit";
  static const creditBuy = "$baseUrl/partner/credit-buy";

  ///Return Trip
  static const returnTripSubmit = "$baseUrl/partner/return-trip-submit";
  static const returnTripBids = "$baseUrl/partner/return-trip-bids";
  static const returnTripConfirm = "$baseUrl/partner/return-trip-confirm";

  ///Vehicle
  static const vehicles = "$baseUrl/partner/vehicles";
  static const vehicleManage = "$baseUrl/partner/vehicle-manage";
  static const fuelTypes = "$baseUrl/partner/fueltypes";
  static const vehicleAdd = "$baseUrl/partner/vehicle-add";
  static const returnTripCompleted = "$baseUrl/partner/return-trip-completed";

  ///common
  static const districts = "$baseUrl/partner/districts";
  static const shareReferKey = "$baseUrl/partner/share-referkey";
  static const offer = "$baseUrl/partner/offer";
  static const help = "$baseUrl/partner/help";
}