<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('firstName','lastName','email','username','password','password-confirm'); section>
    <#if section = "header">
        ${msg("registerTitle")}
    <#elseif section = "form">
        <form id="kc-register-form"
              class="${properties.kcFormClass!}"
              action="${url.registrationAction}"
              method="post">

            <h2 class="${properties.kcTitleClass!}">Register</h2>


            <div class="${properties.kcFormGroupClass!}">
                <div class="input-group-prepend">
                      <span class="input-group-text">
                        <i class="fas fa-address-card"></i>
                      </span>
                </div>
                <input id="firstName"
                       class="${properties.kcInputClass!}"
                       name="firstName"
                       placeholder="FirstName"
                       value="${(register.formData.firstName!'')}"
                       aria-invalid="<#if messagesPerField.existsError('firstName')>true</#if>"
                       type="text"/>
            </div>

            <#if messagesPerField.existsError('firstName')>
                <div class="text-center mb-3">
              <span id="input-error-firstname"
                    class="${properties.kcInputErrorMessageClass!}"
                    aria-live="polite">
                <span class="chips-icon">
                  <i class="fas fa-times"></i>
                </span>
                <span class="chips-label">
                   ${kcSanitize(messagesPerField.get('firstName'))?no_esc}
                </span>
              </span>
                </div>
            </#if>


            <div class="${properties.kcFormGroupClass!}">
                <div class="input-group-prepend">
                      <span class="input-group-text">
                        <i class="fas fa-address-card"></i>
                      </span>
                </div>
                <input id="lastName"
                       class="${properties.kcInputClass!}"
                       name="lastName"
                       placeholder="LastName"
                       value="${(register.formData.lastName!'')}"
                       aria-invalid="<#if messagesPerField.existsError('lastName')>true</#if>"
                       type="text"/>
            </div>

            <#if messagesPerField.existsError('lastName')>
                <div class="text-center mb-3">
              <span id="input-error-lastName"
                    class="${properties.kcInputErrorMessageClass!}"
                    aria-live="polite">
                <span class="chips-icon">
                  <i class="fas fa-times"></i>
                </span>
                <span class="chips-label">
                   ${kcSanitize(messagesPerField.get('lastName'))?no_esc}
                </span>
              </span>
                </div>
            </#if>


            <div class="${properties.kcFormGroupClass!}">
                <div class="input-group-prepend">
                      <span class="input-group-text">
                        <i class="fa fa-envelope"></i>
                      </span>
                </div>
                <input id="email"
                       class="${properties.kcInputClass!}"
                       name="email"
                       autocomplete="email"
                       placeholder="Email"
                       value="${(register.formData.email!'')}"
                       aria-invalid="<#if messagesPerField.existsError('email')>true</#if>"
                       type="text"/>
            </div>

            <#if messagesPerField.existsError('email')>
                <div class="text-center mb-3">

            <span id="input-error-email"
                  class="${properties.kcInputErrorMessageClass!}"
                  aria-live="polite">
              <span class="chips-icon">
                <i class="fas fa-times"></i>
              </span>
              <span class="chips-label">
                 ${kcSanitize(messagesPerField.get('email'))?no_esc}
              </span>
            </span>
                </div>
            </#if>



            <#if !realm.registrationEmailAsUsername>
                <div class="${properties.kcFormGroupClass!}">
                    <div class="input-group-prepend">
                      <span class="input-group-text">
                        <i class="fas fa-user-circle"></i>
                      </span>
                    </div>
                    <input id="username"
                           class="${properties.kcInputClass!}"
                           name="username"
                           autocomplete="username"
                           placeholder="Username"
                           value="${(register.formData.username!'')}"
                           aria-invalid="<#if messagesPerField.existsError('username')>true</#if>"
                           type="text"/>
                </div>

                <#if messagesPerField.existsError('username')>
                    <div class="text-center mb-3">
                <span id="input-error-username"
                      class="${properties.kcInputErrorMessageClass!}"
                      aria-live="polite">
                  <span class="chips-icon">
                    <i class="fas fa-times"></i>
                  </span>
                  <span class="chips-label">
                     ${kcSanitize(messagesPerField.get('username'))?no_esc}
                  </span>
                </span>
                    </div>
                </#if>

            </#if>




            <#if passwordRequired??>
                <div class="${properties.kcFormGroupClass!}">
                    <div class="input-group-prepend">
                      <span class="input-group-text">
                        <i class="fas fa-lock"></i>
                      </span>
                    </div>
                    <input id="password"
                           class="${properties.kcInputClass!}"
                           name="password"
                           autocomplete="new-password"
                           placeholder="Password"
                           aria-invalid="<#if messagesPerField.existsError('password','password-confirm')>true</#if>"
                           type="password"/>
                </div>

                <#if messagesPerField.existsError('password')>
                    <div class="text-center mb-3">
                  <span id="input-error-password"
                        class="${properties.kcInputErrorMessageClass!}"
                        aria-live="polite">
                    <span class="chips-icon">
                      <i class="fas fa-times"></i>
                    </span>
                    <span class="chips-label">
                       ${kcSanitize(messagesPerField.get('password'))?no_esc}
                    </span>
                  </span>
                    </div>
                </#if>

                <div class="${properties.kcFormGroupClass!}">

                    <div class="input-group-prepend">
                      <span class="input-group-text">
                        <i class="fas fa-lock"></i>
                      </span>
                    </div>
                    <input id="password-confirm"
                           class="${properties.kcInputClass!}"
                           name="password-confirm"
                           placeholder="Password confirm"
                           aria-invalid="<#if messagesPerField.existsError('password-confirm')>true</#if>"
                           type="password"/>
                </div>

                <#if messagesPerField.existsError('password-confirm')>
                    <div class="text-center mb-3">
                <span id="input-error-password-confirm"
                      class="${properties.kcInputErrorMessageClass!}"
                      aria-live="polite">
                  <span class="chips-icon">
                    <i class="fas fa-times"></i>
                  </span>
                  <span class="chips-label">
                     ${kcSanitize(messagesPerField.get('password-confirm'))?no_esc}
                  </span>
                </span>
                    </div>
                </#if>
            </#if>




            <#if recaptchaRequired??>
                <div class="form-group">
                    <div class="${properties.kcInputWrapperClass!}">
                        <div class="g-recaptcha" data-size="compact" data-sitekey="${recaptchaSiteKey}"></div>
                    </div>
                </div>
            </#if>


            <div id="kc-form-buttons" class="${properties.kcFormGroupClass!} mb-5">
                <button class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!}"
                        type="submit">
                    Register
                    <i class="fas fa-plus-circle ml-2"></i>
                </button>
            </div>

            <div id="kc-back-login">
                <a href="${url.loginUrl}"
                   class="${properties.kcButtonClass!} ${properties.kcButtonSuccessClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!}">
                    Back to login
                    <i class="fas fa-sign-out-alt ml-2"></i>
                </a>
            </div>

        </form>
    </#if>
</@layout.registrationLayout>