/*
 * Generated by util/mkerr.pl DO NOT EDIT
 * Copyright 1995-2020 The OpenSSL Project Authors. All Rights Reserved.
 *
 * Licensed under the Apache License 2.0 (the "License").  You may not use
 * this file except in compliance with the License.  You can obtain a copy
 * in the file LICENSE in the source distribution or at
 * https://www.openssl.org/source/license.html
 */

#ifndef OPENSSL_OCSPERR_H
# define OPENSSL_OCSPERR_H
# pragma once

# include <openssl/opensslconf.h>
# include <openssl/symhacks.h>
# include <openssl/cryptoerr_legacy.h>


# ifndef OPENSSL_NO_OCSP


/*
 * OCSP function codes.
 */
#  ifndef OPENSSL_NO_DEPRECATED_3_0
#   define OCSP_F_D2I_OCSP_NONCE                            0
#   define OCSP_F_OCSP_BASIC_ADD1_STATUS                    0
#   define OCSP_F_OCSP_BASIC_SIGN                           0
#   define OCSP_F_OCSP_BASIC_SIGN_CTX                       0
#   define OCSP_F_OCSP_BASIC_VERIFY                         0
#   define OCSP_F_OCSP_CERT_ID_NEW                          0
#   define OCSP_F_OCSP_CHECK_DELEGATED                      0
#   define OCSP_F_OCSP_CHECK_IDS                            0
#   define OCSP_F_OCSP_CHECK_ISSUER                         0
#   define OCSP_F_OCSP_CHECK_VALIDITY                       0
#   define OCSP_F_OCSP_MATCH_ISSUERID                       0
#   define OCSP_F_OCSP_REQUEST_SIGN                         0
#   define OCSP_F_OCSP_REQUEST_VERIFY                       0
#   define OCSP_F_OCSP_RESPONSE_GET1_BASIC                  0
#  endif

/*
 * OCSP reason codes.
 */
#  define OCSP_R_CERTIFICATE_VERIFY_ERROR                  101
#  define OCSP_R_DIGEST_ERR                                102
#  define OCSP_R_DIGEST_NAME_ERR                           106
#  define OCSP_R_DIGEST_SIZE_ERR                           107
#  define OCSP_R_ERROR_IN_NEXTUPDATE_FIELD                 122
#  define OCSP_R_ERROR_IN_THISUPDATE_FIELD                 123
#  define OCSP_R_MISSING_OCSPSIGNING_USAGE                 103
#  define OCSP_R_NEXTUPDATE_BEFORE_THISUPDATE              124
#  define OCSP_R_NOT_BASIC_RESPONSE                        104
#  define OCSP_R_NO_CERTIFICATES_IN_CHAIN                  105
#  define OCSP_R_NO_RESPONSE_DATA                          108
#  define OCSP_R_NO_REVOKED_TIME                           109
#  define OCSP_R_NO_SIGNER_KEY                             130
#  define OCSP_R_PRIVATE_KEY_DOES_NOT_MATCH_CERTIFICATE    110
#  define OCSP_R_REQUEST_NOT_SIGNED                        128
#  define OCSP_R_RESPONSE_CONTAINS_NO_REVOCATION_DATA      111
#  define OCSP_R_ROOT_CA_NOT_TRUSTED                       112
#  define OCSP_R_SIGNATURE_FAILURE                         117
#  define OCSP_R_SIGNER_CERTIFICATE_NOT_FOUND              118
#  define OCSP_R_STATUS_EXPIRED                            125
#  define OCSP_R_STATUS_NOT_YET_VALID                      126
#  define OCSP_R_STATUS_TOO_OLD                            127
#  define OCSP_R_UNKNOWN_MESSAGE_DIGEST                    119
#  define OCSP_R_UNKNOWN_NID                               120
#  define OCSP_R_UNSUPPORTED_REQUESTORNAME_TYPE            129

# endif
#endif
