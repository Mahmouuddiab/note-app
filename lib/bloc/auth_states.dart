abstract class AuthStates{}

class AuthInitialState extends AuthStates{}

class RegisterSuccess extends AuthStates{}
class RegisterLoading extends AuthStates{}
class RegisterError extends AuthStates{}

class LoginSuccess extends AuthStates{}
class LoginLoading extends AuthStates{}
class LoginError extends AuthStates{}

class LogoutState extends AuthStates{}