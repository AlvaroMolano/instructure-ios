//
// Copyright (C) 2016-present Instructure, Inc.
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, version 3 of the License.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <http://www.gnu.org/licenses/>.
//
    
    




open class TodoAPI {
    open class func getTodos(_ session: Session) throws -> URLRequest {
        let path = "/api/v1/users/self/todo"
        return try session.GET(path)
    }

    open class func ignoreTodo(_ session: Session, todo: Todo) throws -> URLRequest {
        var request = URLRequest(url: URL(string: todo.ignoreURL)!)
        request.httpMethod = "DELETE"
        if let token = session.token {
            request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        }
        return request
    }
}
