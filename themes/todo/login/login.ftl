<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('username','password') displayInfo=realm.password && realm.registrationAllowed && !registrationDisabled??; section>
    <#if section = "header">
        ${msg("loginAccountTitle")}
    <#elseif section = "form">
        <div id="kc-form">
            <div id="kc-form-wrapper">
                <#if realm.password>
                    <form id="kc-form-login"
                          onsubmit="login.disabled = true; return true;"
                          action="${url.loginAction}"
                          method="post">

                        <h2 class="${properties.kcTitleClass!}">Sign In</h2>

                        <div class="${properties.kcFormGroupClass!}">

                            <#if usernameEditDisabled??>
                                <div class="input-group-prepend">
                                  <span class="input-group-text">
                                    <i class="fa fa-envelope"></i>
                                  </span>
                                </div>
                                <input tabindex="1"
                                       id="username"
                                       class="${properties.kcInputClass!}"
                                       name="username"
                                       placeholder="Username or email"
                                       value="${(login.username!'')}"
                                       type="text" disabled/>
                            <#else>
                                <div class="input-group-prepend">
                                  <span class="input-group-text">
                                    <i class="fa fa-envelope"></i>
                                  </span>
                                </div>
                                <input tabindex="1"
                                       id="username"
                                       class="${properties.kcInputClass!}"
                                       name="username"
                                       placeholder="Username or email"
                                       value="${(login.username!'')}"
                                       type="text"
                                       autofocus
                                       autocomplete="off"
                                       aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>"
                                />
                            </#if>
                        </div>

                        <div class="${properties.kcFormGroupClass!}">
                            <div class="input-group-prepend">
                              <span class="input-group-text">
                                <i class="fa fa-lock"></i>
                              </span>
                            </div>
                            <input tabindex="2"
                                   id="password"
                                   class="${properties.kcInputClass!}"
                                   placeholder="Password"
                                   name="password"
                                   type="password"
                                   autocomplete="off"
                                   aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>"
                            />
                        </div>

                        <div class="${properties.kcFormGroupClass!} ${properties.kcFormSettingClass!}">
                            <div id="kc-form-options">
                                <#if realm.rememberMe && !usernameEditDisabled??>
                                    <div class="checkbox">
                                        <label>
                                            <#if login.rememberMe??>
                                                <input tabindex="3" id="rememberMe" name="rememberMe"
                                                       type="checkbox"
                                                       checked> ${msg("rememberMe")}
                                            <#else>
                                                <input tabindex="3" id="rememberMe" name="rememberMe"
                                                       type="checkbox"> ${msg("rememberMe")}
                                            </#if>
                                        </label>
                                    </div>
                                </#if>
                            </div>
                            <div class="${properties.kcFormOptionsWrapperClass!}">
                                <#if realm.resetPasswordAllowed>
                                    <span>
                                        <a tabindex="5"
                                           href="${url.loginResetCredentialsUrl}">
                                            ${msg("doForgotPassword")}
                                        </a>
                                    </span>
                                </#if>
                            </div>
                        </div>


                        <#if messagesPerField.existsError('username','password')>
                            <div class="text-center mb-3">
                                <span id="input-error"
                                      class="${properties.kcInputErrorMessageClass!}"
                                      aria-live="polite">
                                  <span class="chips-icon">
                                    <i class="fas fa-times"></i>
                                  </span>
                                    <span class="chips-label">
                                       ${kcSanitize(messagesPerField.getFirstError('username','password'))?no_esc}
                                    </span>
                                  </span>
                            </div>
                        </#if>


                        <div id="kc-form-buttons" class="mb-3">
                            <input type="hidden"
                                   id="id-hidden-input"
                                   name="credentialId"
                                   <#if auth.selectedCredential?has_content>value="${auth.selectedCredential}"</#if>/>
                            <button tabindex="4"
                                    class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!}"
                                    name="login"
                                    id="kc-login"
                                    type="submit">
                                Log in
                                <i class="fas fa-arrow-alt-circle-right ml-2"></i>
                            </button>
                        </div>

                        <div id="kc-register-buttons">
                            <p class="text-center font-weight-bold">Not already signed up ?</p>
                            <a href="${url.registrationUrl}"
                               class="${properties.kcButtonClass!} ${properties.kcButtonSuccessClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!}">
                                Register
                                <i class="fas fa-plus-circle ml-2"></i>
                            </a>
                        </div>
                    </form>
                </#if>
            </div>

            <#if realm.password && social.providers??>
                <div id="kc-social-providers" class="${properties.kcFormSocialAccountSectionClass!}">
                    <hr/>
                    <h4>${msg("identity-provider-login-label")}</h4>

                    <ul class="${properties.kcFormSocialAccountListClass!} <#if social.providers?size gt 3>${properties.kcFormSocialAccountListGridClass!}</#if>">
                        <#list social.providers as p>
                            <a id="social-${p.alias}"
                               class="${properties.kcFormSocialAccountListButtonClass!} <#if social.providers?size gt 3>${properties.kcFormSocialAccountGridItem!}</#if>"
                               type="button" href="${p.loginUrl}">
                                <#if p.iconClasses?has_content>
                                    <i class="${properties.kcCommonLogoIdP!} ${p.iconClasses!}" aria-hidden="true"></i>
                                    <span class="${properties.kcFormSocialAccountNameClass!} kc-social-icon-text">${p.displayName!}</span>
                                <#else>
                                    <span class="${properties.kcFormSocialAccountNameClass!}">${p.displayName!}</span>
                                </#if>
                            </a>
                        </#list>
                    </ul>
                </div>
            </#if>

        </div>
    </#if>

</@layout.registrationLayout>
