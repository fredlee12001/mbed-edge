/*
 * ----------------------------------------------------------------------------
 * Copyright 2018 ARM Ltd.
 *
 * SPDX-License-Identifier: Apache-2.0
 *
 * Licensed under the Apache License, Version 2.0 (the "License")
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 * ----------------------------------------------------------------------------
 */

#ifndef EDGE_CONFIG_INFO_H
#define EDGE_CONFIG_INFO_H
#define GIT_DIRTY "dirty"
#define RELEASE_VERSION "0.5.1"
#define GIT_BRANCH "master"
#define GIT_COMMIT "c4dfddedca18402738f54ff26d125b0e8e62da31"
#endif
#ifdef GIT_DIRTY
#define VERSION_STRING RELEASE_VERSION"-"GIT_BRANCH"-"GIT_COMMIT"-"GIT_DIRTY
#else
#define VERSION_STRING RELEASE_VERSION"-"GIT_BRANCH"-"GIT_COMMIT
#endif
