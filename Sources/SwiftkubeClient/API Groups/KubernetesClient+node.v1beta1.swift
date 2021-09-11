//
// Copyright 2020 Swiftkube Project
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

import Foundation
import SwiftkubeModel

// MARK: - NodeV1Beta1API

public protocol NodeV1Beta1API {

	var runtimeClasses: ClusterScopedGenericKubernetesClient<node.v1beta1.RuntimeClass> { get }
}

/// DSL for `node.k8s.io.v1beta1` API Group
public extension KubernetesClient {

	class NodeV1Beta1: NodeV1Beta1API {
		private var client: KubernetesClient

		internal init(_ client: KubernetesClient) {
			self.client = client
		}

		public var runtimeClasses: ClusterScopedGenericKubernetesClient<node.v1beta1.RuntimeClass> {
			client.clusterScoped(for: node.v1beta1.RuntimeClass.self)
		}
	}

	var nodeV1Beta1: NodeV1Beta1API {
		NodeV1Beta1(self)
	}
}
